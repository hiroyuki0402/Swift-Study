import pytest
import time
import sys
import os

# ✅ `appium_tests/` をモジュールパスに追加（`appium_config.py` を見つけるため）
sys.path.append(os.path.abspath(os.path.dirname(__file__) + "/.."))

from appium_config import get_driver

@pytest.fixture(scope="function")
def driver():
    driver = get_driver()
    yield driver
    driver.quit()

def take_screenshot(driver, filename):
    """スクリーンショットを保存するヘルパー関数"""
    path = f"screenshots/{filename}.png"
    driver.get_screenshot_as_file(path)
    print(f"📸 スクリーンショットを保存しました: {path}")

def test_app_launch(driver):
    """アプリ起動時にHello, Appium! が表示されているか確認"""
    time.sleep(2)  # UIがロードされるのを待つ
    take_screenshot(driver, "01_app_launch")

    message_text = driver.find_element("accessibility id", "messageText").text
    assert message_text == "Hello, Appium!"

def test_text_input_and_save(driver):
    """テキストを入力し、保存ボタンを押すとラベルが更新されるか確認"""
    time.sleep(2)

    # テキスト入力
    text_field = driver.find_element("accessibility id", "textField")
    text_field.send_keys("Appium Test")
    take_screenshot(driver, "02_text_input")

    # 保存ボタンを押す
    save_button = driver.find_element("accessibility id", "tapButton")
    save_button.click()
    time.sleep(1)
    take_screenshot(driver, "03_after_save")

    # メッセージが更新されているか確認
    message_text = driver.find_element("accessibility id", "messageText").text
    assert message_text == "Appium Test"

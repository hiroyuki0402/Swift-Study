from appium import webdriver
from appium.options.ios import XCUITestOptions

def get_driver():
    caps = {
        "platformName": "iOS",
        "platformVersion": "18.2",
        "deviceName": "iPhone 16",
        "automationName": "XCUITest",
        "app": "/XXXXXXXXX/XXXXXXX/Library/Developer/Xcode/DerivedData/AppiumEX-ctchqtsrrixowxanrffsgeifaixh/Build/Products/Debug-iphonesimulator/AppiumEX.app",
        "wdaLocalPort": 8100,
        "useNewWDA": True
    }

    options = XCUITestOptions()
    options.load_capabilities(caps)

    return webdriver.Remote("http://127.0.0.1:4723", options=options)


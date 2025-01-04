//
//  TrialItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/16.
//

import SwiftUI

struct TrialItemView: View {
    // MARK: - プロパティー
    /// クーポンデータ
    var coupondata: CouponData

    /// 画像
    @State private var image: Image? = nil
    // MARK: - ボディー

    var body: some View {
        VStack {
            hederStatusView
                .padding(.top, 5)
            HStack {
                imageView
                VStack {
                    HStack(alignment: .top) {
                        title
                        discount
                    }


                    endDate
                        .padding(.bottom, 10)
                }
            }
        }
        .frame(height: 160)
        .padding(.horizontal, 4)
        .padding(.vertical, 10)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .shadow(radius: 3, x: 0, y: 0)
        )
        .padding(.horizontal, 10)
    }//: ボディー

    /// 画像ロード
    private func loadImage() {
        Task {
            if let url = URL(string: coupondata.image) {
                image = await ImageService.shared.loadImageAsImage(url: url)
            }
            return Image("")
        }
    }
}

// MARK: TrialItemViewaアイテム

private extension TrialItemView {
    /// ステータスの状態
    private var hederStatusView: some View {
        HStack {
            Text("引換券")
                .frame(height: 20)
                .foregroundStyle(.pink)
                .background(Color.white) // 背景色を設定
                .overlay(
                    RoundedRectangle(cornerRadius: 2) // 角丸の形状の枠線を適用
                        .stroke(Color.pink, lineWidth: 1) // 青いボーダー、幅2
            )
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.top, 20)
    }

    /// クーポン画像
    private var imageView: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 150, alignment: .top)
                    .padding(.leading, 8)
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    /// タイトル
    private var title: some View {
        Text(coupondata.title)
            .frame(height: 100, alignment: .topLeading)
    }

    /// 割引金額
    private var discount: some View {
            VStack {
                Text(coupondata.discount.description)
                    .fontWeight(.semibold)


                Text("point")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.bottom, 2)
            }
            .padding(5)
            .frame(width: 50, height: 50)
            .foregroundStyle(.gray)
            .background(Color(uiColor: .systemGray5))
            .clipShape(Circle())
        }

    /// 有効期限
    private var endDate: some View {
        HStack {
            Text("有効期限")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            Text(coupondata.endDate.toCustomDateString())
                .fontWeight(.light)

            Spacer()
        }
        .padding(.bottom, 20)
        .padding(.leading, 5)
        .font(.system(size: 14))
    }
}

#Preview {
    TrialItemView(coupondata: TestData.shared.couponData2[0])
}

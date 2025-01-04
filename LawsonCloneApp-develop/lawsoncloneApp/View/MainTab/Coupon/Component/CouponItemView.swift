//
//  CouponItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/30.
//

import SwiftUI
import Kingfisher

struct CouponItemView: View {
    // MARK: - プロパティー

    /// クーポンデータ
    var coupondata: CouponData

    /// 画像
    @State private var image: Image? = nil

    // MARK: - ボディー

    var body: some View {
        VStack {

            /// 使用回数
            moreThanOnce

            HStack (alignment: .bottom) {
                VStack {
                    HStack {
                        /// クーポン画像
                        couponImageView

                        /// タイトル、値段
                        titleArea

                    }//: HStack
                    
                    /// 有効期限
                    endDate

                }//: VStack
                .padding(.trailing, 5)

            }//: HStack

            /// 区切り線
            divider

            /// ボタンエリア
            buttonArea

        }//: VStack
        .padding()
        .background(Rectangle().fill(Color.white))
        .cornerRadius(10)

    }//: ボディー

    // MARK: - メソッド

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

// MARK: - CouponItemViewアイテム

private extension CouponItemView {

    /// クーポン画像
    private var couponImageView: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150, alignment: .bottom)
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    /// タイトル表示エリア
    private var titleArea: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(spacing: 0) {
                title

                Spacer()

                discount
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
        HStack(alignment: .bottom, spacing: 1) {
            Spacer()
            VStack {
                Text(coupondata.discount.description)
                    .font(.title)
                    .fontWeight(.semibold)
            }

            Text("円引")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.bottom, 2)

        }
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
        .font(.system(size: 14))
    }

    /// 使用回数
    private var moreThanOnce: some View {
        HStack {
            Text("何度でも使える")
                .foregroundColor(.blue)
                .padding(3)
                .padding(.horizontal, 5)
                .fontWeight(.semibold)
                .font(.caption)
                .background(Color(uiColor: .systemGray6))
                .clipShape(.capsule)
            Spacer()
        }
    }

    /// 区切り線
    private var divider: some View {
        Line()
            .stroke(style: .init(dash: [4, 3]))
            .foregroundColor(.gray)
            .frame(height: 0.5)
            .padding(.horizontal, 1)
    }

    /// クーポン下部ボタン表示エリア
    private var buttonArea: some View {
        HStack {
            /// 詳細
            detailButton

            Spacer()

            /// 保存
            saveButton
        }
        .padding(.horizontal, 30)
        .padding()
    }

    /// 保存ボタン
    private var saveButton: some View {
        Button {


        } label: {
            HStack(spacing: 0) {
                Image(systemName: "paperclip")
                Text("保存")
                    .foregroundStyle(.black)
            }
        }
    }

    /// 詳細ボタン
    private var detailButton: some View {
        Button {

        } label: {
            HStack(spacing: 0) {
                Image(systemName: "lines.measurement.horizontal")
                Text("詳細")
                    .foregroundStyle(.black)
            }
        }
    }

}

#Preview {
    List {
        CouponItemView(coupondata: TestData.shared.couponData[0])
            .background(Color.black)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
    }
}

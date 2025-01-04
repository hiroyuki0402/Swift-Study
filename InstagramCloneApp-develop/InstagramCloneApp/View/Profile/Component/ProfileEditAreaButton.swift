//
//  ProfileActioinButton.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/09.
//

import SwiftUI

struct ProfileEditAreaButton: View {
    // MARK: - プロパティー
    /// タイトル
    var title: String

    ///  ボタンの高さ
    var frameHeight: CGFloat = 32

    /// 枠線の色
    var borderColor: Color = .gray

    /// 枠線の太さ
    var lineWidth: CGFloat = 1

    /// 枠の角丸
    var cornerRadius: CGFloat = 6
    
    /// ハンドラー
    var action: (() -> Void)?


    // MARK: - ボディー
    var body: some View {
        Button {
            if let action = action {
                action()
            }
        } label: {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(height: frameHeight)
                .frame(maxWidth: .infinity)
                .overlay {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.gray ,lineWidth: lineWidth)
                }
        }
    }
}

#Preview {
    ProfileEditAreaButton(title: "プロフィールを編集")
}

//
//  StatusItemView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/08.
//

import SwiftUI

struct StatusItemView: View {
    // MARK: - ボディー
    var body: some View {
        HStack {
            /// メッセージ
            item(count: "529", icon: "message") {
                
            }
            
            /// リプライ
            item(count: "5411", icon: "arrow.2.squarepath") {
                
            }
            
            /// いいね
            item(count: "5.9万", icon: "heart") {
                
            }
            
            /// 観覧数
            item(count: "1996万", icon: "chart.bar.xaxis") {
                
            }
            
            /// ブックマーク
            item(icon: "bookmark") {
                
            }
            
            /// 送る
            item(icon: "square.and.arrow.up") {
                
            }
        }
    }
    
    // MARK: - メソッド
    
    /// ステータスのアイテム
    /// - Parameters:
    ///   - count: 各アイテムのアクション数
    ///   - icon: アイテムのアイコン
    ///   - didTap: ハンドラー
    /// - Returns: some View
    private func item(count: String? = nil, icon: String = "", didTap: @escaping() -> Void) -> some View {
        Button {
            didTap()
        } label: {
            HStack(spacing: 3) {
                Image(systemName: icon)
                    .fontWeight(.bold)
                Text(count ?? "")
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    StatusItemView()
        .padding(.horizontal, 50)
}

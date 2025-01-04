//
//  FollowView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/08.
//

import SwiftUI

struct FollowView: View {
    // MARK: - プロパティー
    var whoToFollowData: WhoToFollowDatas
    
    /// セクションタイトル
    var sectionTitle: String
    
    // MARK: - ボディー
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            Spacer()
        }
        LazyVStack {
            ForEach(whoToFollowData.prefix(3), id: \.self) { data in
                WhoToFolloewView(whoToFollowData: data)
            }
        }
        
        Button {
            
        } label: {
            HStack {
                Text("さらに表示")
                    .underline()
                    .padding(.horizontal)
                
             Spacer()
                
                Text(">")
                    .padding(.horizontal)
                    
            }
            
        }
        
        Divider()
    }
}

#Preview {
    FollowView(whoToFollowData: TestData.whoToFollowTestDatas(), sectionTitle: "Who to follow")
}

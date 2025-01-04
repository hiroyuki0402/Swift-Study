//
//  RecommendView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/08.
//

import SwiftUI

struct RecommendView: View {
    // MARK: - プロパティー
    var followDatas: FollowDatas
    
    // MARK: - ボディー
    var body: some View {
        LazyVStack {
            ForEach(followDatas, id: \.self) { data in
                UserFeedItemView(followData: data)
                Divider()
            }
        }
    }
}

#Preview {
    RecommendView(followDatas: TestData.followTestDatas())
}

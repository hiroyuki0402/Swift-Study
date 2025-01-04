//
//  ProfileImageView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/18.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    // MARK: - プロパティー
    var userdata: UserData?
    var frameSize: CGFloat = 40
    
    // MARK: - ボディー
    var body: some View {
        if let imageUrl = userdata?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: frameSize, height: frameSize)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: frameSize, height: frameSize)
                .foregroundColor(Color(.systemGray4))
        }
    }//: ボディー
}

#Preview {
    ProfileImageView()
}

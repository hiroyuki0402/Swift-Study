//
//  UserProfileView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/11.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            header()
            ScrollView(.vertical) {
                HeaderView()
            }
        }
    }
    
    
    
    private func header() -> some View  {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrowshape.left.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 12))
                    .padding()
                    .background(.buttonBG)
                    .clipShape(Circle())
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white)
                    .font(.system(size: 12))
                    .padding()
                    .background(.buttonBG)
                    .clipShape(Circle())
            }
            
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(.white)
                    .font(.system(size: 12))
                    .padding()
                    .background(.buttonBG)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    UserProfileView()
}

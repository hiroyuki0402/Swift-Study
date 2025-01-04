//
//  HeaderView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/11.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        userInfo()
            .padding()
    }

    private func userInfo() -> some View {
        VStack {
            userImage()
            userName()
                .padding(.vertical, 5)
            description()
            startedX()
            followStatus()
        }
    }
    
    
    private func userImage() -> some View {
        HStack {
            ZStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background()
                    .clipShape(Circle())
                
            }
            .frame(width: 60, height: 60)
            .background(.black)
            .clipShape(Circle())
            
            Spacer()
            
            Text("編集")
                .background(Color.white)
                .padding(.horizontal)
                .padding(7)
                .border(Color.gray, width: 1)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke()
                )
        }
    }
    
    private func userName() -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("USERINAME")
                        .font(.title)
                        .bold()
                    Image(systemName: "exclamationmark.lock.fill")
                    
                }
                
                Text("@USERIID")
                
            }
            Spacer()
        }
    }
    
    
    private func description() -> some View {
        Text("RIPTIONDESCRIPTIONDESCRIPTIONDESCRIPTIONDESCRIPTIONDESCRIPTIONDESCRIPTIONDESCRIPTION")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func startedX() -> some View {
        HStack {
            Image(systemName: "calendar")
            Text("2024年2月からXを利用開始しています")
                .font(.subheadline)
            Spacer()
        }
        .padding(.vertical, 5)
    }
    
    private func followStatus() -> some View {
        HStack {
            HStack {
                Text("12")
                    .bold()
                Text("フォロー中")
            }
            
            HStack {
                Text("12")
                    .bold()
                Text("フォロワー")
            }
            
            Spacer()
        }
    }
    
    
}

#Preview {
    HeaderView()
}

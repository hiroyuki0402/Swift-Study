//
//  CustomListRowView.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct CustomListRowView: View {

    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil

    var body: some View {

        LabeledContent {
            if let rowContent = rowContent {
                Text(rowContent)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else {
                if let rowLinkLabel = rowLinkLabel,
                   let rowLinkDestination = rowLinkDestination,
                    let url = URL(string: rowLinkDestination) {
                    Link(rowLinkLabel, destination: url)
                        .foregroundColor(.pink)
                        .fontWeight(.heavy)
                } else {
                    EmptyView()
                }
            }

        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 9)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                }
                Text(rowLabel)
            }
        }

    }
}

#Preview {
    List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        CustomListRowView(rowLabel: "Website",
                           rowIcon: "globe",
                           rowContent: nil,
                          rowTintColor: .pink,
                          rowLinkLabel: "Credo Academy",
                          rowLinkDestination: "https://credo.academy"
        )
    }
}

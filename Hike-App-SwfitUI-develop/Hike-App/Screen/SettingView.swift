//
//  SettingView.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct SettingView: View {

    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]

    private let colors: [Color] = [
        .colorGreenLight,
        .colorGreenMedium,
        .colorGreenDark
    ]

    var body: some View {
        List {
            HStack {
                Spacer()

                Image(systemName: "laurel.leading")
                    .font(.system(size: 80, weight: .black))

                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66, weight: .black))

                    Text("Editors Choice")
                        .fontWeight(.medium)
                }

                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80, weight: .black))

                Spacer()
            } //: Header
            .foregroundStyle(colors.addGradation())
            .padding(.top, 8)

            VStack(spacing: 8) {
                Text("SettingViewQuestion")
                    .font(.title2)
                    .fontWeight(.heavy)

                Text("SettingViewComment")
                    .font(.footnote)
                    .italic()

                Text("SettingViewCatchphrase")
                    .fontWeight(.heavy)
                    .foregroundColor(.colorGreenMedium)

            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
            .listRowSeparator(.hidden)

            Section(header: Text("Alternate Icon")) {

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if let err = error {
                                        print(err.localizedDescription)
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }


                } //: ScrollerView
                .padding(.top, 12)

                Text("SettingAltenateIconDescription")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: Section
            .listSectionSeparator(.hidden)


            Section(
                header: Text("About The App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)

                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)

                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SwiftUI", rowTintColor: .orange)

                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)

                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "SHIRAISHI", rowTintColor: .mint)

                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)

                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "GitHUb", rowLinkDestination: "https://github.com/hiroyuki0402")
            }
        }
    }
}

#Preview {
    SettingView()
}

/*
 .header: Text("About The App"),
 .footer: HStack {


 */

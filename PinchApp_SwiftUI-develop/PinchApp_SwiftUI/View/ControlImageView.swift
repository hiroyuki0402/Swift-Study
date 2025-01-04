//
//  ControlImageView.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import SwiftUI

struct ControlImageView: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 40))
            .foregroundColor(.white)
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
}

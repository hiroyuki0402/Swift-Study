//
//  CheckBox.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/19.
//

import SwiftUI

struct CheckBox: View {
    ///.constantバイディングの時は必要
    @Binding var isCheked: Bool
    var body: some View {
        Image(chackImage())
            .resizable()
            .scaledToFill()
            .frame(width: 66, height: 66)
            .onTapGesture {
                isCheked.toggle()
            }
    }

    func chackImage() -> String {
        let check = "check"
        let unchek = "uncheck"
        return isCheked ? check: unchek
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        /// 以下の行を追加
        ForEach(["iPhone SE", "iPhone XS Max", "iPhone X"], id: \.self) { deviceName in
            CheckBox(isCheked: .constant(false))
                /// 以下の2行を追加
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}



//
//  lawsoncloneAppApp.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import SwiftUI
import FirebaseCore

@main
struct lawsoncloneAppApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
      WindowGroup {
        NavigationView {
            MainTabView()
        }
      }
    }
  }

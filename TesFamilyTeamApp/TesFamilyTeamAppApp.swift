//
//  TesFamilyTeamAppApp.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 18.06.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseRemoteConfig
import FirebaseRemoteConfigSwift


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var remoteConfig = RemoteConfigManager()

  var body: some Scene {
    WindowGroup {
      NavigationView {
          if remoteConfig.getUpdatedResult() {
              UpdateView()
          }
          else {
              TabBarView()
          }
        
      }
    }
  }
}

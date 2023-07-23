//
//  User_Login_Sign_Up_AppApp.swift
//  User_Login_Sign_Up_App
//
//  Created by thanhdat on 22/07/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
				   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	FirebaseApp.configure()

	return true
  }
}


@main
struct User_Login_Sign_Up_AppApp: App {
	// register app delegate for Firebase setup
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
			MainView()
        }
    }
}

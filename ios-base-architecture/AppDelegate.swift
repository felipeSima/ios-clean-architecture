//
//  AppDelegate.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/18/20.
//

import UIKit
import Firebase
import FirebaseMessaging
import DropDown
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //FirebaseApp.configure()
        
        RealmManager.shared.Configure()
        
        DropDown.startListeningToKeyboard()
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}


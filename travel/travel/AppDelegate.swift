//
//  AppDelegate.swift
//  travel
//
//  Created by Svetlana Safonova on 02.03.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white,
             NSAttributedString.Key.font : CustomFonts.openSans(size: 18, style: .regular)]
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white,
             NSAttributedString.Key.font : CustomFonts.openSans(size: 36, style: .semibold)]
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = .black
        UITabBar.appearance().barTintColor = UIColor(red: 135/255, green: 127/255, blue: 158/255, alpha: 1)
        FirebaseApp.configure()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


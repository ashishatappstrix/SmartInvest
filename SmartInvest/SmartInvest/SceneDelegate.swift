//
//  SceneDelegate.swift
//  SmartInvest
//
//  Created by Ashh on 6/6/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navController = UINavigationController()
            let navBarFont = UIFont.systemFont(ofSize: 17, weight: .bold)
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navBarFont]
            UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light)], for: UIControl.State.normal)
            
            UINavigationBar.appearance().barTintColor = UIColor(red: 101.0/255.0, green: 57.0/255.0, blue: 171.0/255.0, alpha: 1.0)
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barStyle = UIBarStyle.black
            
            let viewController = Router.initAchievements()
            navController.viewControllers = [viewController]
            window.rootViewController = navController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


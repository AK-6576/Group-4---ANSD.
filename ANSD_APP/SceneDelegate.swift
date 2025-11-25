//
//  SceneDelegate.swift
//  ANSD_APP
//
//  Created by Daiwiik on 25/11/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            // 1. Ensure the scene is a UIWindowScene
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            // 2. Create a new UIWindow using the windowScene
            let window = UIWindow(windowScene: windowScene)
            
            // 3. Instantiate the HomeViewController (assuming you are using the code provided previously)
            let homeVC = HomeViewController()
            
            // OPTIONAL: Embed the HomeViewController in a UINavigationController for a title bar and navigation capabilities
            // let navigationController = UINavigationController(rootViewController: homeVC)
            
            // 4. Set the HomeViewController as the root view controller of the window
            window.rootViewController = homeVC // Use 'navigationController' if you uncommented the line above
            
            // 5. Assign the newly created window to the SceneDelegate's window property
            self.window = window
            
            // 6. Make the window visible
            window.makeKeyAndVisible()
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


//
//  SceneDelegate.swift
//  Exercise11_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 9.08.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private var storage: CornerRadiusStorageProtocol!
    var window: UIWindow?

    weak var delegate: FirstViewControllerDelegate?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController:ViewController())
        window.makeKeyAndVisible()
        self.window = window
        storage = CornerRadiusStorage()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        self.delegate?.updateCornerRadius(2)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        self.delegate?.updateCornerRadius(5)
//        let date = Date()
//        print(date)
 
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


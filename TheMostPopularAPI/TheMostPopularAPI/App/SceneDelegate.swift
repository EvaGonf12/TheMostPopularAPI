//
//  SceneDelegate.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window : UIWindow?
    
    lazy var appCoordinator: AppCoordinator = {
        guard let window = self.window else { fatalError() }
        let coordinator = AppCoordinator(window: window)
        return coordinator
    }()
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let customWindow = UIWindow(windowScene: windowScene)
        window = customWindow
        appCoordinator.start()
    }
}


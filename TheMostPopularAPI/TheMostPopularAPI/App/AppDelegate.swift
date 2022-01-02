//
//  AppDelegate.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    lazy var appCoordinator: AppCoordinator = {
        guard let window = self.window else { fatalError() }
        let coordinator = AppCoordinator(window: window)
        return coordinator
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
            if #available(iOS 13, *) {} else {
                self.window = UIWindow()
                appCoordinator.start()
            }
            return true
    }
}

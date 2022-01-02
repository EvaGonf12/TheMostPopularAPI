//
//  AppCoordinator.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - PRESENTER
    lazy var presenter: UINavigationController = {
        let presenter = UINavigationController()
        return presenter
    }()
    
    // Window
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        window.rootViewController = presenter
        window.makeKeyAndVisible()
        presentFilter()
    }
    
    override func finish() {}
}

extension AppCoordinator {
    
    func presentFilter() {
        let viewController = ViewController()
        presenter.pushViewController(viewController, animated: true)
    }
}

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
        let viewModel = FilterViewModel()
        let viewController = FilterViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        viewModel.viewDelegate = viewController
        presenter.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: FilterCoordinatorDelegate {
    
    func applyFilters(_ filters: FiltersSelected) {
        
    }
}

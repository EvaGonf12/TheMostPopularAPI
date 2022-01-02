//
//  ArticlesCoordinator.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import UIKit

final class ArticlesCoordinator: Coordinator {
    
    let filters: FiltersSelected
    let articlesDIContainer: ArticlesDIContainer
    let presenter: UINavigationController
    
    init(filters: FiltersSelected,
         presenter: UINavigationController,
         articlesDIContainer: ArticlesDIContainer) {
        
        self.filters = filters
        self.presenter = presenter
        self.articlesDIContainer = articlesDIContainer
    }
    
    override func start() {
        let viewModel = ArticlesListViewModel(filters: filters,
                                              listUseCase: articlesDIContainer.articlesListUseCase)
        
        let viewController = ArticlesListViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        viewModel.viewDelegate = viewController
        
        presenter.pushViewController(viewController, animated: true)
    }
    
    override func finish() {}
}

// MARK: - ArticlesList

extension ArticlesCoordinator: ArticlesListCoordinatorDelegate {

    func didSelect(article: Article) {
        let viewModel = ArticleDetailsViewModel(title: article.title,
                                                link: article.url)
        let viewController = ArticleDetailsViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        viewModel.viewDelegate = viewController
        presenter.pushViewController(viewController, animated: true)
    }
}

// MARK: - ArticlesDetails
extension ArticlesCoordinator: ArticleDetailsCoordinatorDelegate {
    func goBack() {
        presenter.popViewController(animated: true)
    }

}

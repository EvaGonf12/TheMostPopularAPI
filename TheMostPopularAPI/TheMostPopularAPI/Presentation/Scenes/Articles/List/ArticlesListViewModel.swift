//
//  ArticlesListViewModel.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol ArticlesListCoordinatorDelegate: AnyObject {
    func didSelect(article: Article)
}

protocol ArticlesListViewDelegate: AnyObject {
    func setupUI()
    func didFailLoadingArticles()
    func didLoadArticles()
}

class ArticlesListViewModel {
    weak var coordinatorDelegate: ArticlesListCoordinatorDelegate?
    weak var viewDelegate: ArticlesListViewDelegate?
    let filterSelected: FiltersSelected
    let listUseCase: ArticlesListUseCase
    var articlesList: [Article]
    private var disposeBag: DisposeBag
    
    init(filters: FiltersSelected,
         listUseCase: ArticlesListUseCase,
         disposeBag: DisposeBag = DisposeBag()) {
        self.filterSelected = filters
        self.listUseCase = listUseCase
        self.articlesList = []
        self.disposeBag = disposeBag
    }
    
    func didLoad() {
        viewDelegate?.setupUI()
        fetchArticles()
    }
    
    func reloadArticles() {
        fetchArticles()
    }
    
    private func fetchArticles() {
        listUseCase.execute(with: filterSelected)
            .subscribe {[weak self] data in
                self?.articlesList = data
                self?.viewDelegate?.didLoadArticles()
            } onFailure: {[weak self] error in
                print(error)
                self?.viewDelegate?.didFailLoadingArticles()
            } onDisposed: {}
            .disposed(by: disposeBag)
    }
}

// MARK: - Table
extension ArticlesListViewModel {
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return articlesList.count
    }
    
    func viewModel(at indexPath: IndexPath) -> ArticleRowViewModel? {
        guard indexPath.row < articlesList.count else { return nil }
        return ArticleRowViewModel(article: articlesList[indexPath.row])
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < articlesList.count else { return }
        let article = articlesList[indexPath.row] as Article
        coordinatorDelegate?.didSelect(article: article)
    }
}

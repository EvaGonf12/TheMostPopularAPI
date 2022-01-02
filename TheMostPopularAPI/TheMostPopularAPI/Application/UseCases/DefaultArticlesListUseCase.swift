//
//  DefaultArticlesListUseCase.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

final class DefaultArticlesListUseCase: ArticlesListUseCase {
    private let articlesRepository: ArticlesRepository
    
    init(articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(with params: FiltersSelected) -> Single<[Article]> {
        return articlesRepository.getArticlesList(with: params)
    }
}

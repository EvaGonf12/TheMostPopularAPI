//
//  DefaultArticlesRepository.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

class DefaultArticlesRepository: ArticlesRepository {
    
    let remoteDataSource: ArticlesDataSource
    
    init(remoteDataSource: ArticlesDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getArticlesList(with params: FiltersSelected) -> Single<[Article]> {
        return remoteDataSource.list(with: params)
    }
}

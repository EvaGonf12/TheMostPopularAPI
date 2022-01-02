//
//  DefaultArticlesListDataSource.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

final class DefaultArticlesListDataSource: ArticlesDataSource {
    
    private let networkService: NetworkService
    private let listMapper: ArticlesListRemoteToEntityMapper
    
    init(networkService: NetworkService,
         listMapper: ArticlesListRemoteToEntityMapper) {
        self.networkService = networkService
        self.listMapper = listMapper
    }

    func list(with filter: FiltersSelected) -> Single<[Article]> {
        let request = ArticlesListRequest(filter: filter)
        
        return networkService
            .request(from: request)
            .map(listMapper.map)
    }
    
}

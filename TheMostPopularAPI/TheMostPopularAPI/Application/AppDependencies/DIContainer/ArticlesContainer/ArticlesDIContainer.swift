//
//  ArticlesDIContainer.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

final class ArticlesDIContainer {

    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Use Case
    lazy var articlesListUseCase: ArticlesListUseCase = {
        return DefaultArticlesListUseCase(articlesRepository: articlesRepository)
    }()
    
    // MARK: - Repositories
    lazy var articlesRepository: ArticlesRepository = {
        return DefaultArticlesRepository(remoteDataSource: articlesDataSource)
    }()

    
    // MARK: - Data Source
    private lazy var articlesDataSource: ArticlesDataSource = {
        return DefaultArticlesListDataSource(networkService: networkService,
                                             listMapper: articlesListRemoteMapper)
    }()
    
    // MARK: - Mapper
    
    private lazy var articlesListRemoteMapper: ArticlesListRemoteToEntityMapper = {
       return ArticlesListRemoteToEntityMapper()
    }()
}

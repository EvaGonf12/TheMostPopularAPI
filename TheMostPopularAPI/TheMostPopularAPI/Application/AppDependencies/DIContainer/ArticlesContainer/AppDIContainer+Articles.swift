//
//  AppDIContainer.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

extension AppDIContainer {
    func makeArticlesSceneDIContainer() -> ArticlesDIContainer {
        return ArticlesDIContainer(networkService: networkService)
    }
}

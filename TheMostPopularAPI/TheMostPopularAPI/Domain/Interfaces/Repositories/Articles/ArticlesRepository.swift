//
//  ArticlesRepository.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol ArticlesRepository {
    func getArticlesList(with params: FiltersSelected) -> Single<[Article]>
}

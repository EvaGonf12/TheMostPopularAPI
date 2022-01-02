//
//  ArticlesDataSource.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol ArticlesDataSource {
    func list(with filter: FiltersSelected) -> Single<[Article]>
}

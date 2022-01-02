//
//  ArticlesListUseCase.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol ArticlesListUseCase: AutoMockable {
    func execute(with params: FiltersSelected) -> Single<[Article]>
}

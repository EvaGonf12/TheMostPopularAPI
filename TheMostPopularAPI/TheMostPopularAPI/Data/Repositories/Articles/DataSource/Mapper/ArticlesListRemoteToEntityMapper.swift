//
//  ArticlesListRemoteToEntityMapper.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

struct ArticlesListRemoteToEntityMapper: Mappable {
    
    func map(_ from: ArticlesAPI) -> [Article] {
        return from.results.compactMap{ Article(from: $0) }
    }
}

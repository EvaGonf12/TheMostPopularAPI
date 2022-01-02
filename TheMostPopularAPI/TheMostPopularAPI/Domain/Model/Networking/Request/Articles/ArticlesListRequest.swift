//
//  NewsRequest.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import Alamofire

struct ArticlesListRequest: APIRequest {
    
    typealias Response = ArticlesAPI
    
    let filter: FiltersSelected
    
    init(filter: FiltersSelected) {
        self.filter = filter
    }
    
    var apiType: ApiType {
        return .backend
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        if let source = filter.mostSharedSource {
            let sourceString = source.compactMap { $0.rawValue }
            return "/\(filter.articleType.rawValue)/all-sections/\(sourceString.joined(separator: ";"))/\(filter.interval.rawValue).json"
        } else {
            return "/\(filter.articleType.rawValue)/all-sections/\(filter.interval.rawValue).json"
        }
    }
    
    var parameters: Parameters {
        return ["api-key" : Environment.apiKey] as Parameters
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var contentType: String {
        return "application/json"
    }
    
}

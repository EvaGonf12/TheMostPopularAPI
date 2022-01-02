//
//  NetworkingService.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol NetworkService {
    func request<T: APIRequest>(from request: T) -> Single<T.Response>
}

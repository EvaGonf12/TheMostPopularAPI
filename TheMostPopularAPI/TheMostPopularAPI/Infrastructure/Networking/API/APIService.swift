//
//  APIService.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import Alamofire
import RxSwift

final class APIService: NetworkService {
    
    func request<T: APIRequest>(from request: T) -> Single<T.Response> {
        return Single.create { single in
            AF.request(request.fullURL(),
                       method: request.method,
                       parameters: request.parameters,
                       encoding: request.encoding)
                .validate(statusCode: 200..<400)
                .responseString { response in
                    print("CALL RESPONSE: \(String(describing: response.value))")
                }
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(T.Response.self, from: data) as T.Response
                            single(.success(json))
                        } catch {
                            single(.failure(error))
                        }
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }

}

//
//  APIRequest.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import Alamofire

enum HeaderType: String {
    case contentType = "Content-Type"
    case auth = "Authorization"
    case origin = "x-origin"
}

enum ApiType {
    case backend
}

enum BodyEncoding {
    case jsonSerializationData
    case stringEncodingAscii
}

protocol APIRequest {
    associatedtype Response: Codable

    var apiType: ApiType { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    var contentType: String { get }
}

extension APIRequest {
    
    var baseUrl: String {
        switch apiType {
        case .backend:
            return Environment.apiURL
        }
    }
    
    func fullURL() -> String {
        return (apiType == .backend) ? baseUrl.appending(path) : baseUrl.appending(path)
    }
}

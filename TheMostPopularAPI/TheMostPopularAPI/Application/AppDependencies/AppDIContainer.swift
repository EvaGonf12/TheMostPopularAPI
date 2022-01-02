//
//  AppDIContainer.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

final class AppDIContainer {
    /*
        MARK: - Remote Service
     */
    
    /// Combine Backend Service
    lazy var networkService: APIService = {
        let network = APIService()
        return network
    }()
}

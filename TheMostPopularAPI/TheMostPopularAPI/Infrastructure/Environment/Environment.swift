//
//  Environment.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import Foundation

struct Environment {
    // API
    static var apiURL = value(named: .apiURL)
    static var apiKey = value(named: .apiKey)
}

private enum Constant: String {
    case apiURL = "API_URL"
    case apiKey = "API_KEY"
}

extension Environment {
    private static func value(named name: Constant) -> String {
        return value(named: name.rawValue)
    }
    
    private static func value(named name: String) -> String {
        let key = name
        let value = variable(named: key) ?? valueFromPlist(named: key)
        guard !value.isEmpty else { fatalError() }
        return value
    }
    
    private static func variable(named name: String) -> String? {
        let processInfo = ProcessInfo.processInfo
        guard let value = processInfo.environment[name] else {
            return nil
        }
        return value
    }
    
    private static func valueFromPlist(named: String) -> String {

        guard let url = Bundle.main.path(forResource: "Info",
                                         ofType: "plist") else { fatalError() }
                
        guard let dictionary = NSDictionary(contentsOfFile: url) else { fatalError() }
        guard let value = dictionary.value(forKey: named) as? String else { fatalError() }
        return value
    }
}


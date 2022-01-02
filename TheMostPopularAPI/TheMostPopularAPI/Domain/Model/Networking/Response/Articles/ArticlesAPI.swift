//
//  NewsAPI.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

// MARK: - Welcome
struct ArticlesAPI: Codable {
    let results: [ArticlesAPIResult]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct ArticlesAPIResult: Codable {
    let url: String?
    let publishedDate, section: String?
    let byline: String?
    let title: String?
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case url
        case publishedDate = "published_date"
        case section
        case byline, title
        case media
    }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType?
    let subtype: Subtype?
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

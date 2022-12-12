//
//  NewYorkNews.swift
//  AppNoticias
//
//  Created by Antonio Vuono on 11/12/22.
//

import Foundation

struct NewYorkNews: Codable {
    let status, copyright: String
    let numberOfResults: Int
    let results: [ResultNews]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numberOfResults = "num_results"
        case results
    }
}
    
struct ResultNews: Codable {
    let uri: String
    let url: String
    let id, assetId : Int
    let source: Source
    let publishedDate, updated, section, subsection: String
    let nytdsection, adxKeywords: String
    let column, byline: String
    let type: ResultType
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaId: Int
    
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetId = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline
        case type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaId = "eta_id"
        
    }
}
        
struct Media: Codable {
        let type: MediaType
        let subtype: Subtype
        let caption, copyright: String
        let approvedFprSyndication: Int
        let mediaMetadatum: [MediaMetadatum]
        
        enum CodingKeys: String, CodingKey {
            case type, subtype, caption, copyright
            case approvedFprSyndication = "approved_for_syndication"
            case mediaMetadatum = "media-metadata"
        }
    }
        
struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
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

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
}

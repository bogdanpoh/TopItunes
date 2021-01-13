//
//  TrackChart.swift
//  Songer
//
//  Created by Bogdan Pohidnya on 24.11.2020.
//  Copyright © 2020 Bogdan Pohidnya. All rights reserved.
//

import Foundation

struct ResponseChart: Decodable {
    let feed: ResponceFeed
}

struct ResponceFeed: Decodable {
    let title: String
    let results: [Chart]
}

struct Chart: Decodable {
    
    let artistName: String
    let id: String
    let releaseDate: String?
    let name: String
    let collectionName: String?
    let kind: String
    let copyright: String?
    let artistId: String?
    let contentAdvisoryRating: String?
    let artistUrl: String?
    let artworkUrl100: String
    let url: String
}

//struct Genre: Decodable {
//    let genreId: String
//    let name: String
//    let url: String
//}

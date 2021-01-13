//
//  ChartURL.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 07.01.2021.
//

import Foundation

//Itunes Music
//new-music
//recent-releases
//hot-tracks
//top-albums
//top-songs


class ChartURLBuilder {
    
    enum MusicSource: String, CaseIterable {
        case itunes = "itunes-music"
        case appleMusic = "apple-music"
    }
    
    enum ItunesMusicCategory: String, CaseIterable {
        case newMusic = "new-music"
        case recentReleases = "recent-releases"
        case hotTracks = "hot-tracks"
        case topAlbums = "top-albums"
        case topSongs = "top-songs"
    }
    
    enum MusicCountry: String, CaseIterable {
        case usa
        case ua
        case ru
        case pl
    }
    
    enum MusicCountResponse: Int, CaseIterable {
        case ten = 10
        case fifty = 50
        case seventyFive = 75
        case hundred = 100
    }
    
    enum MusicExplicit: String, CaseIterable {
        case nonExplicit = "non-explicit"
        case explicit = "explicit"
    }
    
    let scheme: String
    let host: String
    
    let musicSource: MusicSource
    let musicCategory: ItunesMusicCategory
    let musicCountry: MusicCountry
    let musicCountResponse: MusicCountResponse
    let musicExplicit: MusicExplicit
    
    init(musicSource: MusicSource,
         musicCategory: ItunesMusicCategory,
         musicCountry: MusicCountry,
         musicCountResponse: MusicCountResponse = .seventyFive,
         musicExplicit: MusicExplicit = .nonExplicit) {
        
        scheme = "https"
        host = "rss.itunes.apple.com"
        
        self.musicSource = musicSource
        self.musicCategory = musicCategory
        self.musicCountry = musicCountry
        self.musicCountResponse = musicCountResponse
        self.musicExplicit = musicExplicit
    }
    
    func getURL() -> URL? {
        return URL(string: getURLString())
    }
    
    func getURLString() -> String {
        
        let source = musicSource.rawValue
        let country = musicCountry.rawValue
        let category = musicCategory.rawValue
        let count = musicCountResponse.rawValue
        let explicit = musicExplicit.rawValue
        
        return scheme + "://" + host + "/api/v1/\(country)/\(source)/\(category)/all/\(count)/\(explicit).json"
    }
    
    static func getMusicSourceName() -> [String] {
        
        return MusicSource.allCases.map {
            formatedString($0.rawValue, isCapitalized: true)
        }
        
    }
    
    static func getItunesMusicCategory() -> [String] {
        
        return ItunesMusicCategory.allCases.map {
            formatedString($0.rawValue, isCapitalized: true)
        }
        
    }
    
    static func getCountry() -> [String] {
        return MusicCountry.allCases.map {
            $0.rawValue.uppercased()
        }
    }
    
    static func getCountValue() -> [Int] {
        return MusicCountResponse.allCases.map {
            $0.rawValue
        }
    }
    
    static func getMusicExplicit() -> [String] {
        return MusicExplicit.allCases.map {
            formatedString($0.rawValue, isCapitalized: true)
        }
    }
    
    static func formatedString(_ string: String, isCapitalized: Bool) -> String {
        
        let newString = string.replacingOccurrences(of: "-", with: " ")
        
        return isCapitalized ? newString.capitalized : newString
    }
    
    static func formatedFromString(_ string: String) -> String {
        let newString = string.replacingOccurrences(of: " ", with: "-")
        
        return newString.lowercased()
    }
}

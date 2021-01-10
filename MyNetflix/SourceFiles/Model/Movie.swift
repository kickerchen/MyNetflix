//
//  Movie.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import Foundation

enum MovieType {
    case movie
    case tvShow
}

struct Movie: Identifiable {
    var id: String // swiftlint:disable:this identifier_name
    var name: String
    var thumbnailURL: URL
    var categories: [String]

    // MovieDetail view
    var year: Int
    var rating: String
    var numberOfSeasons: Int?

    // Personalization
    var currentEpisode: CurrentEpisodeInfo?

    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String

    var moreLikeThisMovies: [Movie]

    var episodes: [Episode]?

    var movieType: MovieType { episodes == nil ? .movie : .tvShow }

    var promotionHeadline: String?

    var trailers: [Trailer]

    var numberOfSeasonsDisplay: String {
        guard let num = numberOfSeasons else { return "" }
        return num == 1 ? "1 season" : "\(num) seasons"
    }

    var episodeInfoDisplay: String {
        guard let current = currentEpisode else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
        return "S\(current.season):E\(current.episode) \(current.episodeName)"
    }

    var episodeDescriptionDisplay: String {
        guard let current = currentEpisode else { return defaultEpisodeInfo.description }
        return current.description
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

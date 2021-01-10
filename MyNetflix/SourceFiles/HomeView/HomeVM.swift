//
//  HomeVM.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import Foundation

class HomeVM: ObservableObject {

    @Published var movies: [String: [Movie]] = [:]

    public var allCategories: [String] { movies.keys.map {String($0)} }

    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter { $0.movieType == .movie }
        case .tvShows:
            return (movies[cat] ?? []).filter { $0.movieType == .tvShow }
        case .myList:
            return movies[cat] ?? []
            // TODO: setup MyList properly
        }
    }

    init() {
        setupMovies()
    }

    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
    }
}

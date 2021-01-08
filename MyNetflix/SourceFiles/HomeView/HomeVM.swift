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

    public func getMovie(forCat cat: String) -> [Movie] { movies[cat] ?? [] }

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

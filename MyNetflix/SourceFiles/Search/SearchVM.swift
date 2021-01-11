//
//  SearchVM.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/11.
//

import Foundation

enum ViewState {
    case empty
    case loading
    case ready
    case error
}

class SearchVM: ObservableObject {

    @Published var isLoading = false

    @Published var viewState: ViewState = .ready

    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []

    @Published var isShowingPopularMovies = true

    init() {
        getPopularMovies()
    }

    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        if !text.isEmpty {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }

    private func getPopularMovies() {
        popularMovies = generateMovies(40)
    }

    private func getSearchResults(forText text: String) {
        let haveResult = Int.random(in: 0...3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }

    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
}

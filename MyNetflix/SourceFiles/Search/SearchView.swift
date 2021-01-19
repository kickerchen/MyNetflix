//
//  SearchView.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/11.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel = SearchVM()

    @State private var searchText = ""

    @State private var movieDetailToShow: Movie? = nil

    var body: some View {

        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            viewModel.updateSearchText(with: $0)
        }

        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBar(text: searchTextBinding, isLoading: $viewModel.isLoading)
                    .padding()

                ScrollView {
                    if viewModel.isShowingPopularMovies {
                        PopularList(movies: viewModel.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }

                    if viewModel.viewState == .empty {
                        Text("Your search did not have any results.")
                            .bold()
                            .padding(.top, 150)
                    } else if viewModel.viewState == .ready && !viewModel.isShowingPopularMovies {
                        Text("Search Results")
                    }
                }

                Spacer()
            }

            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {

    var movies: [Movie]

    @Binding var movieDetailToShow: Movie?

    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }

            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}

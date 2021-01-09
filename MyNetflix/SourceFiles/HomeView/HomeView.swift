//
//  HomeView.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre {
    case allGenres
    case action
    case comedy
    case horror
    case thriller
}

struct HomeView: View {
    var viewModel = HomeVM()

    @State private var movieDetailToShow: Movie?

    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .allGenres

    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            // main vstack
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack {

                    // swiftlint:disable:next line_length
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)

                    TopMoviePreview(movie: exampleMovie4)
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.top, -110)
                        .zIndex(-1)

                    ForEach(viewModel.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                        }

                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack {
                                ForEach(viewModel.getMovie(forCat: category)) { movie in
                                    StandardHomeMovie(movie: movie)
                                        .frame(width: 100, height: 200)
                                        .padding(.horizontal, 20)
                                        .onTapGesture {
                                            movieDetailToShow = movie
                                        }
                                }
                            }
                        })
                    }
                }
            })

            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

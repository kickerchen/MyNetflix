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

struct HomeView: View {
    var viewModel = HomeVM()

    @State private var movieDetailToShow: Movie?

    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: MovieGenre = .allGenres

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

                    // swiftlint:disable:next line_length
                    HomeStack(viewModel: viewModel, topRowSelection: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            })

            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }

            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)

                    VStack(spacing: 40) {
                        Spacer()

                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in

                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                        }

                        Spacer()

                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }

            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)

                    VStack(spacing: 40) {
                        Spacer()

                        ScrollView {
                            ForEach(viewModel.allGenre, id: \.self) { genre in

                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text("\(genre.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }
                                })
                                .padding(.bottom, 40)
                            }
                        }

                        Spacer()

                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
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

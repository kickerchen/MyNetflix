//
//  TopRowButtons.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/9.
//

import SwiftUI

struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: MovieGenre

    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool

    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())

                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text("All Genres")
                                .font(.system(size: 12 ))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

struct TopRowButtons_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable:next line_length
        TopRowButtons(topRowSelection: .constant(.home), homeGenre: .constant(.allGenres), showGenreSelection: .constant(false), showTopRowSelection: .constant(false))
    }
}

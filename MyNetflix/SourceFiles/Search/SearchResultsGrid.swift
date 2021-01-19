//
//  SearchResultsGrid.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/19.
//

import SwiftUI

struct SearchResultsGrid: View {
    var movies: [Movie]

    @Binding var movieDetailToShow: Movie?

    let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {

        LazyVGrid(columns: layout, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture(perform: {
                        movieDetailToShow = movie
                    })
            }
        }

    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}

//
//  MoreLikeThis.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/7.
//

import SwiftUI

struct MoreLikeThis: View {
    var movies: [Movie]

    let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {

        LazyVGrid(columns: layout) {
            ForEach(0..<movies.count) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }

    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}

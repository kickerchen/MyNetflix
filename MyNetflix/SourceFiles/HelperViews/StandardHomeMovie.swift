//
//  StandardHomeMovie.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie: Movie

    var body: some View {
        GeometryReader { geo in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width)
                .clipped()
        }
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie2)
    }
}

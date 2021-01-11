//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    var movie: Movie

    func isCategoryLast(_ cat: String) -> Bool {
        movie.categories.firstIndex(of: cat) == movie.categories.count - 1
    }

    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()

            VStack {
                Spacer()

                HStack {
                    ForEach(movie.categories, id: \.self) { cat in

                        HStack {
                            Text(cat)
                                .font(.footnote)

                            if !isCategoryLast(cat) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }

                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        //
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)
                    Spacer()
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //
                    }
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie4)
    }
}

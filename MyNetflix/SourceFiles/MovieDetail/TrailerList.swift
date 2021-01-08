//
//  TrailerList.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/8.
//

import SwiftUI

struct TrailerList: View {
    var trailers: [Trailer]

    let screen = UIScreen.main.bounds

    var body: some View {
        VStack {
            ForEach(trailers) { trailer in

                VStack {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)

                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        TrailerList(trailers: exampleTrailers)
    }
}

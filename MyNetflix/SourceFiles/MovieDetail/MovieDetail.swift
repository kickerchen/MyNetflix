//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie

    let screen = UIScreen.main.bounds

    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ZStack {
                VStack {
                    HStack {
                        Spacer()

                        Button(action: {
                            // dismiss
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                        .padding(.horizontal, 22)
                    }

                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5)

                            MovieInfoSubheadline(movie: movie)

                            if let promotion = movie.promotionHeadline {
                                Text(promotion)
                                    .bold()
                                    .font(.headline)
                            }

                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                //
                            }

                            CurrentEpisodeInformation(movie: movie)

                            CastInfo(movie: movie)

                            HStack(spacing: 60) {
                                // swiftlint:disable line_length
                                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                    //
                                }
                                SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                    //
                                }
                                SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                    //
                                }
                                // swiftlint:enable line_length
                                Spacer()
                            }
                            .padding(.leading, 20)

                            // swiftlint:disable:next line_length
                            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                        }
                        .padding(.horizontal, 10)
                    })

                    Spacer()
                }
                .foregroundColor(.white)

                if showSeasonPicker {
                    SeasonPicker(movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1)
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie

    var body: some View {
        HStack {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)

            Text(String(movie.year))

            RatingView(rating: movie.rating)

            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    var movie: Movie

    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie

    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)

            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct SeasonPicker: View {
    var movie: Movie

    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int

    var body: some View {
        Group {
            Color.black.opacity(0.9)

            VStack(spacing: 40) {
                Spacer()

                ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                    Button(action: {
                        selectedSeason = season + 1
                        showSeasonPicker = false
                    }, label: {
                        Text("Season \(season + 1)")
                            .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                            .font(selectedSeason == season + 1 ? .title : .title2)
                            .bold()
                    })
                }

                Spacer()

                Button(action: {
                    showSeasonPicker = false
                }, label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .scaleEffect(x: 1.1)
                })
                .padding(.bottom, 30)
            }
        }
    }
}

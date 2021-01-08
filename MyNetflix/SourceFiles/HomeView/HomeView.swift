//
//  HomeView.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeVM()

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            // main vstack
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack {

                    TopRowButtons()

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
                                }
                            }
                        })
                    }
                }
            })
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                //
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Button(action: {
                //
            }, label: {
                Text("TV Shows")
            })
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Button(action: {
                //
            }, label: {
                Text("Movies")
            })
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Button(action: {
                //
            }, label: {
                Text("My List")
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}

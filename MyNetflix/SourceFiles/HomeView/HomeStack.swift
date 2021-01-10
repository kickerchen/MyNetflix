//
//  HomeStack.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/9.
//

import SwiftUI

struct HomeStack: View {

    var viewModel: HomeVM
    var topRowSelection: HomeTopRow

    @Binding var movieDetailToShow: Movie?

    var body: some View {
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
                LazyHStack {
                    ForEach(viewModel.getMovie(forCat: category, andHomeRow: topRowSelection)) { movie in
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
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                HomeStack(viewModel: HomeVM(), topRowSelection: .movies, movieDetailToShow: .constant(nil))
            }
        }.foregroundColor(.white)
    }
}

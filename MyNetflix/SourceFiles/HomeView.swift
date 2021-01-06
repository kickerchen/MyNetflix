//
//  HomeView.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main vstack
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack {
                    ForEach(vm.allCategories, id: \.self) { category in
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
                                ForEach(vm.getMovie(forCat: category)) { movie in
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

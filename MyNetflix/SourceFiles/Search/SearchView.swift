//
//  SearchView.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/11.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel = SearchVM()

    @State private var searchText = ""

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBar(text: $searchText, isLoading: $viewModel.isLoading)
                    .padding()

                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

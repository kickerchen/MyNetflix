//
//  Movie.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/6.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
}

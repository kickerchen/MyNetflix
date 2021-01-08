//
//  Episode.swift
//  NetflixClone
//
//  Created by CHENCHIAN on 2021/1/6.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString // swiftlint:disable:this identifier_name

    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int

    var thumbnailURL: URL { URL(string: thumbnailImageURLString)! }
}

//
//  Trailer.swift
//  MyNetflix
//
//  Created by CHENCHIAN on 2021/1/8.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString // swiftlint:disable:this identifier_name
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}

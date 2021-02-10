//
//  AboutCanada.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 9/16/20.
//  Copyright © 2020 Vivek Goswami. All rights reserved.
//

import Foundation

class AboutCanada: Codable {
    var title: String?
    var rows: [Rows]?
    private enum CodingKeys: String, CodingKey {
        case title
        case rows
    }}
class Rows: Codable {
    var title: String?
    var description: String?
    var photoUrl: String?
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case photoUrl = "imageHref"
    }
}

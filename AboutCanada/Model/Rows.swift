//
//  Rows.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/11/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

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

//
//  AboutCanada.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 9/16/20.
//  Copyright © 2020 Vivek Goswami. All rights reserved.
//

import Foundation
import ObjectMapper

class AboutCanada : Model {
	var title : String?
	var rows : [Rows]?

	required init() {
        super.init()
    }
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
		title       <- map["title"]
		rows        <- map["rows"]
	}
}
class Rows : Model {
    var title : String?
    var description : String?
    var imageHref : String?

    required init() {
        super.init()
    }
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {

        title           <- map["title"]
        description     <- map["description"]
        imageHref       <- map["imageHref"]
    }
}

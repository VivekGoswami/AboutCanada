//
//  Model.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 9/16/20.
//  Copyright © 2020 Vivek Goswami. All rights reserved.
//

import ObjectMapper

class Model: Mappable {
    
    required init() {
        
    }
    
    required init?(map: Map) {
        self.mapping(map: map)
    }
    func mapping(map: Map) {
    }
}

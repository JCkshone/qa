//
//  Pqrs.swift
//  qa-application
//
//  Created by Apple on 5/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Pqrs: Mappable {
    var comments:String?
    var pqrs_type: Int?
    
    init() {
    }
    func mapping(map: Map) {
        comments <- map["comments"]
        pqrs_type <- map["pqrs_type"]
    }
    required init?(map: Map) {
    }
}

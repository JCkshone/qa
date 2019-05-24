//
//  ApiResponseModel.swift
//  qa-application
//
//  Created by Apple on 5/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiResponseModel: Mappable {
    
    var code: Int?
    var message:String?
    var response:String?
    
    init() {}
    
    func mapping(map: Map) {
        self.code <- map["code"]
        self.response <- map["messages"]
        self.message <- map["message"]
    }
    
    
    required init?(map: Map) {}
}

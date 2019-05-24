//
//  RegisterRequestModel.swift
//  qa-application
//
//  Created by Apple on 5/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisterRequestModel: Mappable {
    
    var user: AccountModel?
    var pqrs:Pqrs?
    
    init() {}
    
    func mapping(map: Map) {
        self.pqrs <- map["pqrs"]
        self.user <- map["user"]
    }
    required init?(map: Map) {}
}

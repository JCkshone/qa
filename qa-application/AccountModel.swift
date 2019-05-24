//
//  AccountModel.swift
//  qa-application
//
//  Created by Apple on 5/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class AccountModel: Mappable {
    var first_name: String?
    var middle_name: String?
    var surname: String?
    var second_surname: String?
    var phone: String?
    var person_status: Int?
    var nuip: String?
    var email: String?
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.first_name <- map["first_name"]
        self.middle_name <- map["middle_name"]
        self.surname <- map["surname"]
        self.second_surname <- map["second_surname"]
        self.phone <- map["phone"]
        self.person_status <- map["person_status"]
        self.nuip <- map["nuip"]
        self.email <- map["email"]
    }
    
    
    
}


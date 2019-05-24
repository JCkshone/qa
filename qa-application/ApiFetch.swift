//
//  ApiFetch.swift
//  qa-application
//
//  Created by Apple on 5/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum NetworkError {
    case failure
    case success
}

class APIFetch {
    
    let baseApi:String = "http://104.248.224.18/v1"
    
    
    func userRegister(registerInfo: RegisterRequestModel, success:@escaping (ApiResponseModel) -> Void, failure:@escaping (Error) -> Void ){
        let url: String = "\(baseApi)/person/create_user_and_pqrs"
        
        Alamofire.request(url, method: .post, parameters: registerInfo.toJSON(), encoding: JSONEncoding.default, headers: nil).responseObject {(response:DataResponse<ApiResponseModel>) in
            if response.result.isSuccess {
                if let services = response.result.value {
                    success(services)
                }else{
                    success(ApiResponseModel())
                }
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
}

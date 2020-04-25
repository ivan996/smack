//
//  AuthServices.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 25/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import Foundation
import Alamofire


class AuthService{
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard //najjednostavniji nacin za cuvanje podataka
    var isLoggedIN: Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
            
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    var authToken: String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail: String{
        get{
                   return defaults.value(forKey: USER_EMAIL) as! String
               }
               set{
                   defaults.set(newValue, forKey: USER_EMAIL)
               }
    }
    
    func registerUSer(email: String, password: String,completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        let header = HTTPHeaders(["Content-Type":"aplication/json; charset = utf-8"])
        
        let body:[String:Any?] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header , interceptor: nil).responseString { (response) in
            if response.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    
}

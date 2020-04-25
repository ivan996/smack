//
//  AuthServices.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 25/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


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
        
        
        AF.request(URL_REGISTER, method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: header , interceptor: nil).responseString { (response) in
            if response.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    func loginUSer(email:String, password: String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        let header = HTTPHeaders(["Content-Type":"aplication/json; charset = utf-8"])
        let body:[String:Any?] = [
                   "email": lowercaseEmail,
                   "password": password
               ]
        AF.request(URL_REGISTER, method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: header , interceptor: nil).responseJSON { (response) in
            if response.error == nil{
//                //prvi nacin low base
//                if let json = response.value as? Dictionary<String, Any>{
//                    if let emailR = json["user"] as? String{
//                        self.userEmail = emailR
//                    }
//                    if let token = json["token"] as? String{
//                        self.authToken = token
//                    }
//                }
                
                //Using SwiftyJSON
                guard let data = response.data else {return}
                do{
                    let json = try JSON(data:data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                }catch{
                }
                self.isLoggedIN = true
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        let body:[String: Any] = [
            "name": name,
            "email":lowercaseEmail,
            "avatarName":avatarName,
            "avatarColor":avatarColor
        ]
        let header = HTTPHeaders([
            "Content-Type":"aplication/json; charset = utf-8",
            "Authorization": "Bearer \(AuthService.instance.authToken)"
        ])
        AF.request(URL_USER_ADD, method: .post, parameters: body as Parameters, encoding: JSONEncoding.default, headers: header , interceptor: nil).responseJSON { (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                do{
                    let json = try JSON(data:data)
                    let idR = json["_id"].stringValue
                    let colorR = json["avatarColor"].stringValue
                    let avatarNameR = json["avatarName"].stringValue
                    let emailR = json["email"].stringValue
                    let nameR = json["name"].stringValue
                    UserDataService.instance.setUserData(id: idR, avatarColor: colorR, avatarName: avatarNameR, email: emailR, name: nameR)
                
                    
                }catch{
                }
            }else{
                completion(false)
                debugPrint(response.error)
            }
        }
    }
    
    
}

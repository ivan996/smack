//
//  Constants.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 06/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) ->()

//URL Constants
let BASE_URL = "http://chattychatjb.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT =  "toCreateAccount"
let UNWIND = "unwindToChannel"

//User defaults
let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

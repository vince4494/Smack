//
//  Constants.swift
//  Smack
//
//  Created by vince zipparro on 11/7/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import Foundation


//renaming a type

typealias CompletionHandler = (_ Sucess: Bool) ->()

//URL Constants
let BASE_URL = "https://smackapichat.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"

//Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


//User defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

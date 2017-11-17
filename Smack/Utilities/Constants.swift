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
//these URLS are going to a specific location on the API so the API knows what to do with the information from the request
let BASE_URL = "https://smackapichat.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"
let TO_AVATAR_PICKER = "toAvatarPicker"

//Colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
    
]

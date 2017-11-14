//
//  AuthService.swift
//  Smack
//
//  Created by vince zipparro on 11/8/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//singleton
class AuthService
{
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool
    {
        get
        {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set
        {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String
    {
        get
        {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set
        {
             defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String
    {
        get
        {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set
        {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil
            {
                completion(true)
            }
            else
            {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil
            {
                //method to parse JSON not using SwiftyJson
//                if let json = response.result.value as? Dictionary<String, Any>{
//                        if let email = json["user"] as? String
//                        {
//                            self.userEmail = email
//                        }
//                        if let token = json["token"] as? String
//                        {
//                            self.authToken = token
//                        }
//
//                    }
                
                //Using SwiftyJSON
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue //string value safely unwraps for you
                self.authToken = json["token"].stringValue
            
                self.isLoggedIn = true
                completion(true)
            }else
                {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            
        }
    }
    
    func createUser(name:String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization":"Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
          Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil
            {
                guard let data = response.data else {return}
                let json = JSON(data: data)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                completion(true)
                
            }
            else
            {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        
    }
    
    }
    
}
        


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


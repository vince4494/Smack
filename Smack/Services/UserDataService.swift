//
//  UserDataService.swift
//  Smack
//
//  Created by vince zipparro on 11/14/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import Foundation

//singleton
class UserDataService
{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatorColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String)
    {
        self.id = id
        self.avatorColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String)
    {
        self.avatarName = avatarName
    }
    
    func returnUIColor(comnponents: String) -> UIColor
    {        
        let scanner = Scanner(string: comnponents)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        //scanning for colors in array
        var r, g, b, a : NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        
        
        let defaultColor = UIColor.lightGray
        
        //unwrapping
        guard let rUnwrapped = r else{return defaultColor}
        guard let gUnwrapped = g else{return defaultColor}
        guard let bUnwrapped = b else{return defaultColor}
        guard let aUnwrapped = a else{return defaultColor}
        
        //converting
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)

        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)

        return newUIColor
    }
    
    func logoutUser()
    {
        id = ""
        avatarName = ""
        avatorColor = ""
        email = ""
        name = ""
        
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
    
    

    
}

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

    
}

//
//  MessageCell.swift
//  Smack
//
//  Created by vince zipparro on 12/7/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell
{
    //outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configureCell(message: Message)
    {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
    }

   
}

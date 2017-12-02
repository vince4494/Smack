//
//  ChatVC.swift
//  Smack
//
//  Created by vince zipparro on 11/2/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class ChatVC: UIViewController
{

    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn
        {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        
        
    }
    
    @objc func userDataDidChange(_ notif: Notification)
    {
        if AuthService.instance.isLoggedIn
        {
           onLoginGetMessages()
            
        }
        else
        {
            channelNameLabel.text = "Please Login"
        }
    }
    
    @objc func channelSelected(_ notif: Notification)
    {
        updateWithChannel()
    }
    
    func updateWithChannel()
    {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLabel.text = "#\(channelName)"
    }
    
    func onLoginGetMessages()
    {
        MessageService.instance.findAllChannel { (success) in
            if success
            {
                //do stuff with channels
            }
        }
    }

  

}

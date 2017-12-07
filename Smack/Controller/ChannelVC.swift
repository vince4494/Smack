//
//  ChannelVC.swift
//  Smack
//
//  Created by vince zipparro on 11/2/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //Outlets
    //button outlet needs to be created since the name of the button will change once the user is logged in
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.channelsLoaded(_:)), name: NOTIF_CHANNELS_LOADED, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if(success)
            {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        setupUserInfo()
    }
    
    @IBAction func addChannelPressed(_ sender: Any)
    {
        if AuthService.instance.isLoggedIn
        {
            let addChannel = AddChannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
            
        }

    }
    
    @IBAction func loginBtnPressed(_ sender: Any)
    {
        if AuthService.instance.isLoggedIn
        {
            //Show profile page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)

        }

        
    }
    
    //called everytime we receive the notification
    @objc func userDataDidChange(_ notif: Notification)
    {
        setupUserInfo()
    }
    
    @objc func channelsLoaded(_ notif: Notification)
    {
        tableView.reloadData()
    }
    
    func setupUserInfo()
    {
        if AuthService.instance.isLoggedIn
        {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatorColor)
        }
        else
        {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell
        {
            let channel = MessageService.instance
            .channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        }
        else
        {
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let channel = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = channel
        NotificationCenter.default.post(name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        self.revealViewController().revealToggle(animated: true)
    }
    
    
    
    
}

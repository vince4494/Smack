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
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        setupUserInfo()
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
    
    func setupUserInfo()
    {
        if AuthService.instance.isLoggedIn
        {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(comnponents: UserDataService.instance.avatorColor)
        }
        else
        {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
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
    
    
    
    
    
    
}

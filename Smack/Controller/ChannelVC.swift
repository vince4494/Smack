//
//  ChannelVC.swift
//  Smack
//
//  Created by vince zipparro on 11/2/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController
{
    //Outlets
    //button outlet needs to be created since the name of the button will change once the user is logged in
    @IBOutlet weak var loginBtn: UIButton!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func loginBtnPressed(_ sender: Any)
    {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}

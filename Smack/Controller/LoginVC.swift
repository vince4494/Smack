//
//  LoginVCViewController.swift
//  Smack
//
//  Created by vince zipparro on 11/7/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any)
    {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    


}

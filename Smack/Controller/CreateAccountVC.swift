//
//  CreateAccountVC.swift
//  Smack
//
//  Created by vince zipparro on 11/7/17.
//  Copyright © 2017 vince zipparro. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    @IBAction func closePressed(_ sender: Any)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    


}

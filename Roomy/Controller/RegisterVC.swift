//
//  RegisterVCViewController.swift
//  Roomy
//
//  Created by Hady on 12/3/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    guard let email = 
    @IBAction func registerPressed(_ sender: UIButton) {
       API.register(email: email, name: name, password: password) { (_ error: Error?, _ success: Bool) in
           if success {
               print("welcome")
           }
       }
        }
        }
    


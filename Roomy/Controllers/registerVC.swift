//
//  registerVCViewController.swift
//  Roomy
//
//  Created by Hady on 12/4/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

class registerVC: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerBtn.layer.cornerRadius = registerBtn.frame.height / 2
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let name = nameTF.text , !name.isEmpty else {return}
        guard let email = emailTF.text, !email.isEmpty else {return}
        guard let password = passwordTF.text , !password.isEmpty else {return}
        NetworkManger.register(name: name, email: email, password: password) { (responseServer, error) in
            guard let theResponse = responseServer else {return}
            if theResponse.message ==  "Account created successfully" {
                let token = theResponse.auth_token
                print("my Register Token is : \(token!)")
            }else {
                print("\(String(describing: theResponse.message))")
            }
            
        }
        
        }
    }
    
   


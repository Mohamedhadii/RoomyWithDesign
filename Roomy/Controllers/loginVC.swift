//
//  loginVC.swift
//  Roomy
//
//  Created by Hady on 12/3/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class loginVC: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Roomy Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
       loginIndicator.isHidden = true
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTF.text , !email.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        loginIndicator.isHidden = false
        NetworkManger.Login(email: email, password: password) { (responseServer, error) in
            
            guard let theResponse = responseServer else {return}
            if theResponse.message == "Invalid credentials"{
                let Alert = UIAlertController(title: "Wrong data", message: "You have entered wrong username or password", preferredStyle: .alert)
                       let Action = UIAlertAction(title: "Ok", style:.default, handler: nil)
                       Alert.addAction(Action)
                self.loginIndicator.isHidden = true
                       self.present(Alert,animated: true,completion: nil)
                print("login failddddddd")
            }else {
                let Token = theResponse.auth_token
                UserDefaults.standard.set(Token, forKey: "token")
                // save token useer default
                print("My Auth_Token is : \(String(describing: Token))")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil) // navigating to home screen
                let tasks = storyBoard.instantiateViewController(identifier: "main") as! RoomVC
                self.navigationController?.pushViewController(tasks, animated: true)
            }
        

        }
    
    }
        
}
    


//
//  ViewController.swift
//  Roomy
//
//  Created by Hady on 12/3/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      // splachScreen()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(splachScreen), userInfo: nil, repeats: false)
        }
    
    
    
  @objc func splachScreen(){
//       DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//            let vc = UIStoryboard(name: "Main", bundle: nil)
//            let tap = vc.instantiateViewController(identifier: "login")
//            self.navigationController?.pushViewController(tap, animated: true)
//          //  self.present(tap, animated: true, completion: nil)
//            })
    let vc = UIStoryboard(name: "Main", bundle: nil)
    let tap = vc.instantiateViewController(identifier: "login")
    self.navigationController?.pushViewController(tap, animated: true)
    }

   
}

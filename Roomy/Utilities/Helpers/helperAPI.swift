//
//  helperAPI.swift
//  Roomy
//
//  Created by Hady on 12/5/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

class helperAPI: NSObject {
    


    class func saveToken(token: String){
        let user = UserDefaults.standard
        user.set(token, forKey: "auth_token")
        user.synchronize()
      
    }
    
    
   class func getToken ()-> String? {
        let user = UserDefaults.standard
    return user.object(forKey: "auth_token") as? String
    }
    
    
}


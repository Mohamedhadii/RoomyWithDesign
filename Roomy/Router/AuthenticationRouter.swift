//
//  AuthenticationRouter.swift
//  Roomy
//
//  Created by Hady on 1/20/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum AuthernticationRouter : URLRequestConvertible{
    case Login(email: String , password: String)
    case SignUp(name: String,email: String , password: String)
    case fetchRoom
    
    func asURLRequest() throws -> URLRequest {
        let url:URL = {
                   switch self {
                   case .Login:
                       return URL(string:"https://roomy-application.herokuapp.com/auth/login")!
                   case .SignUp:
                       return URL(string:"https://roomy-application.herokuapp.com/signup")!
                   case .fetchRoom:
                    return URL(string: "https://roomy-application.herokuapp.com/rooms")!
            }
               }()
               
               let parameter: [String:Any]? = {
                   switch self {
                   case .Login(let email, let password):
                       return ["email": email , "password": password]

                   case .SignUp(let name, let email, let password):
                       return ["name": name , "email": email , "password": password]
                   
                   case .fetchRoom:
                       return nil
                }
                   
               }()
               let method: HTTPMethod = {   //http method  is enum
                   switch self {
                   case .Login , .SignUp:
                       return .post
                   
                   case .fetchRoom:
                    return .get
                }
               }()
        
        var urlRequest = try! URLRequest(url: url, method: method)
        switch self {
        case.fetchRoom:
            let token = UserDefaults.standard.value(forKey: "token")
           urlRequest.addValue(token as! String, forHTTPHeaderField: "Authorization")
            
            
        case .Login: break
            
        case .SignUp: break
            
        }
        let encoding: ParameterEncoding = JSONEncoding.default
        return try! encoding.encode(urlRequest, with: parameter)
    }
   
    
    
}

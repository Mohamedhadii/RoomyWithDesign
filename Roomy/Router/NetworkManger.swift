//
//  NetworkManger.swift
//  Roomy
//
//  Created by Hady on 1/20/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import Foundation
import  Alamofire
import SwiftyJSON

class NetworkManger {
    static func Login(email: String , password: String , completionHandler:@escaping(responseServer?, Error?)-> ()){
        let loginRequest = AuthernticationRouter.Login(email: email, password: password)
        Alamofire.request(loginRequest).responseJSON { (response) in
            switch response.result {
            
            case.success:
                guard let myresponse = response.data else {return }
                // data return by server
                do {
                                   let decoder = JSONDecoder()
                                   let data = try decoder.decode(responseServer.self, from: myresponse)
                                   completionHandler(data,nil)
                               } catch {
                                   print(" error occured during Login: \(error)")
                               }
                case.failure(let error):
                completionHandler(nil, error)
                print(error)
                
                }
            }
        }
    //Mark register page
    static func register(name: String , email: String, password: String, completionHandler: @escaping(responseServer? , Error?)-> Void){
        let registerRequest = AuthernticationRouter.SignUp(name: name, email: email, password: password)
        Alamofire.request(registerRequest).validate(statusCode: 200..<300).responseJSON { (response) in
            switch response.result {
                
            case .success:
                guard let responseData = response.data else {return}
                               do {
                                   let decoder = JSONDecoder()
                                   let data = try decoder.decode(responseServer.self, from: responseData)
                                   completionHandler(data,nil)
                               } catch {
                                   print(" error occured: \(error)")
                               }
            case .failure(let error):
                completionHandler(nil , error)
            
            }
        }
    }
    
    // Mark FetchRoom
    static func getRooms(completionHandler: @escaping([Room]? , Error?)-> Void){
        let roomRequest = AuthernticationRouter.fetchRoom
        Alamofire.request(roomRequest).responseJSON { (response) in
            switch response.result {
                
            case .success:
              //  guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode([Room].self, from: response.data!)
                    print(Room.self)
                    completionHandler(data, nil)
                } catch {
                    print(" an error occured: \(error)")
                }
            case .failure(let error):
                completionHandler(nil , error)
            
            }
        }
    }
    }
    


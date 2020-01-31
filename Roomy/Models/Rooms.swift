//
//  Rooms.swift
//  Roomy
//
//  Created by Hady on 1/21/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import Foundation
struct Room: Codable{
    let id:         Int?
    let title:      String?
    let description:String?
    let place:      String?
    let price:      String?
    let image:      String?
    let created_at: String?
    let updated_at: String?
}

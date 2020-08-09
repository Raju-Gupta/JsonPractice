//
//  Model.swift
//  JsonPractice
//
//  Created by Raju Gupta on 21/02/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import UIKit

struct Photos : Codable {
    let albumId : Int
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl : String
}


struct Users : Codable{
    let id : Int
    let name : String
    let username : String
    let email : String
    let address : userAddress
    let phone : String
    let website : String
    let company : userCompany
        
}

struct userAddress : Codable{
    let street : String
    let suite : String
    let city : String
    let zipcode : String
    let geo : userGeo
}

struct userGeo : Codable {
    let lat : String
    let lng : String
}

struct userCompany : Codable {
    let name : String
    let catchPhrase : String
    let bs : String
}


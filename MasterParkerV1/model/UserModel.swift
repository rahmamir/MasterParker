//
//  UserModel.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-08.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class UserModel{
    
    var name : String
    var email : String
    var password : String
    var contactNumber : String
    var carPlateNumber : String
    
    init(name: String, email: String, password: String, contactNumber: String, carPlateNumber: String) {
        self.name = name
        self.email = email
        self.password = password
        self.contactNumber = contactNumber
        self.carPlateNumber = carPlateNumber
    }
}

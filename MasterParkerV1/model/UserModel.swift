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
    var numOfParkingsMade : Int
    var currentMonth : Date
    
    init(Name: String, Email: String, Password: String, ContactNumber: String, CarPlateNumber: String) {
        self.name = Name
        self.email = Email
        self.password = Password
        self.contactNumber = ContactNumber
        self.carPlateNumber = CarPlateNumber
        self.numOfParkingsMade = 0
        self.currentMonth = Date()
    }
}

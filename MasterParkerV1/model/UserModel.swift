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
    var contactNumber : Int
    var carPlateNumber : String
    //var paymentModel : PaymentModel
    
    init(Name: String, Email: String, Password: String, ContactNumber: Int, CarPlateNumber: String) {
        self.name = Name
        self.email = Email
        self.password = Password
        self.contactNumber = ContactNumber
        self.carPlateNumber = CarPlateNumber
        //self.paymentModel = PaymentModel()
    }
    /*
    init(Name: String, Email: String, Password: String, ContactNumber: String, CarPlateNumber: String/*, PaymentModel : PaymentModel*/) {
        self.name = Name
        self.email = Email
        self.password = Password
        self.contactNumber = ContactNumber
        self.carPlateNumber = CarPlateNumber
        //self.numOfParkingsMade = 0
        //self.currentMonth = Date()
        //self.paymentModel = PaymentModel
    }
    */
    /*
     user.setValue(newUser.name, forKey: "name")
     user.setValue(newUser.email, forKey: "email")
     user.setValue(newUser.password, forKey: "password")
     user.setValue(newUser.contactNumber, forKey: "contactNumber")
     user.setValue(newUser.carPlateNumber, forKey: "carPlateNumber")
     */
     
}

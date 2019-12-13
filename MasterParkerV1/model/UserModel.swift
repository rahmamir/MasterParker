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
    var paymentModel : PaymentModel
    
    init(Name: String, Email: String, Password: String, ContactNumber: Int, CarPlateNumber: String) {
        self.name = Name
        self.email = Email
        self.password = Password
        self.contactNumber = ContactNumber
        self.carPlateNumber = CarPlateNumber
        self.paymentModel = PaymentModel()
    }

    init(Name: String, Email: String, Password: String, ContactNumber: Int, CarPlateNumber: String, PaymentModel : PaymentModel) {
        self.name = Name
        self.email = Email
        self.password = Password
        self.contactNumber = ContactNumber
        self.carPlateNumber = CarPlateNumber
        self.paymentModel = PaymentModel
    }
    
    init(){
        self.name = ""
        self.email = ""
        self.password = ""
        self.contactNumber = 0
        self.carPlateNumber = ""
        self.paymentModel = PaymentModel()
    }

}

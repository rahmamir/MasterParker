//
//  User2.swift
//  MasterParkerV1
//
//  Created by Syed Rehan on 2019-11-14.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class User2
{
    var name: String
    var email: String
    var password: String
    var contactNumber: String
    var carPlateNumber: String
    //var paymentInfo : Payment
    
    init(Name: String, Email: String, Password: String, ContactNumber: String, CarPlateNumber: String)
    {
        self.name = Name
        self.email = Email
        self.password = Password
        self.carPlateNumber = CarPlateNumber
        self.contactNumber = ContactNumber
     //   self.paymentInfo = PaymentInfo
    }
}

//
//  PaymentModel.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-08.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class PaymentModel{
    
    var expiryDate: String//easier to handle
    var cardName: String
    var cardNumber : Int
    var cvvNumber: Int
        
    init(){
        self.expiryDate = "" 
        self.cvvNumber = -1
        self.cardNumber = -1
        self.cardName = ""
    }
    
    init(ExpiryDate: String, CardName: String, CvvNumber: Int, CardNumber: Int) {
        self.expiryDate = ExpiryDate
        self.cardName = CardName
        self.cvvNumber = CvvNumber
        self.cardNumber = CardNumber
    }
}
    


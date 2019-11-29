//
//  PaymentModel.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-08.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class PaymentModel{
    
    enum CardType : String{
        case CreditCard
        case DebitCard
    }
        
    var expiryDate: Date
    var nameOnCard: String
    var cardNumber : Int
    var cvvNumber: Int = 0
    var cardType: CardType
        
    init(){
        self.expiryDate = Date()
        self.cvvNumber = -1
        self.cardNumber = -1
        self.nameOnCard = ""
        self.cardType = CardType.CreditCard
    }
    
    init(expiryDate: Date, nameOnCard: String, cvvNumber: Int, cardNumber: Int, cardType: CardType) {
        self.expiryDate = expiryDate
        self.nameOnCard = nameOnCard
        self.cvvNumber = cvvNumber
        self.cardNumber = cardNumber
        self.cardType = cardType
    }
    
    
        
}
    


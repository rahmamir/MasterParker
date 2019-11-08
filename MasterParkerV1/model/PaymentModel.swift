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
    var cvvNumber: Int = 0
    var cardType: CardType
        
    init(expiryDate: Date, nameOnCard: String, cvvNumber: Int, cardType: CardType) {
        self.expiryDate = expiryDate
        self.nameOnCard = nameOnCard
        self.cvvNumber = cvvNumber
        self.cardType = cardType
    }
        
}
    


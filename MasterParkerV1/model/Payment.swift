//
//  Payment.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-07.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class Payment{
    
    enum CardType : String{
        case Debit
        case Credit
        
        func day() -> String{
            return self.rawValue
        }
    }
    
    var cardName : String
    var cvvNumber : Int
    var expiryDate : Date
    var cardType : CardType
    
    init(cardName: String, cvvNumber: Int, expiryDate: Date, cardType: CardType) {
        self.cardName = cardName
        self.cardType = cardType
        self.cvvNumber = cvvNumber
        self.expiryDate = expiryDate
    }
}

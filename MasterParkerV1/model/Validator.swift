//
//  Validator.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-29.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class Validator {
    
    var userInput : String
    var listOfErrorMessages : [String]
    
    init() {
        self.userInput = ""
        self.listOfErrorMessages = []
    }

    enum ValidatorType : CaseIterable{
        case email
        case genericNumber
        case numberWithinBounds
        case numberWithCharacterCount
        case password
    }

    func validatorFor(userInput: String, type: ValidatorType, bounds : Int = -1, characterCount : Int = -1) -> Bool {
        self.userInput = userInput
        switch type {
            case .email: return self.genericValidator(regEx: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", errorMessage: "Invalid email format, must be : {localpart}@{domain}.com")
            
            case .genericNumber: return self.genericValidator(regEx: "[0-9]+", errorMessage: "Invalid input type, must be a number")
            
            case .numberWithinBounds : return self.genericValidator(regEx: "[0-9]+", errorMessage: "Number outside bounds, must be a number < \(bounds)", Bounds: bounds)
            
            case .password: return self.genericValidator(regEx: "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}", errorMessage: " Must have 1 character\nMust have 1 special character\nPassword length > 8")
            
            case .numberWithCharacterCount : return self.genericValidator(regEx: "^[0-9]{\(characterCount)}$", errorMessage: "Number must be a \(characterCount) digit number", CharacterCount : characterCount)
        }
    }
    
    private func genericValidator(regEx : String, errorMessage: String, Bounds: Int = -1, CharacterCount : Int = -1) -> Bool{
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        
        if(pred.evaluate(with: userInput)){//if userInput matches regex expression
            if(Bounds == -1 || CharacterCount == -1){//IMPROVE THIS
                listOfErrorMessages.append("")//no errors
                return true
            }
            else{
                if(Int(userInput)! <= Bounds){//manual, as regex cannot evaluate value,
                    listOfErrorMessages.append("")
                    return true
                }
            }
            if(CharacterCount != -1){
                if(userInput.count==10){
                    listOfErrorMessages.append("")//no errors
                    return true
                }
            }
        }
        listOfErrorMessages.append(errorMessage)//update error message
        return false
    }

    /*
     let newName = nameTextField.text! any string no validation
     let newEmail = emailTextField.text! email
     let newPassword = passwordTextField.text! passwordvalidation
     let newContactNumber = Int(contactNumberTextField.text!) genericNumber
     let newCarPlateNumber = carPlateNumberTextField.text! //random string < 10 length
     */
    /*
     let buildingCode:Int? = Int(buildingCodeTxt.text!) generic number
     let numOfHours:Int? = Int(numOfHoursTxt.text!) generic number within bounds
     let carPlateNum = carPlateNumberTxt.text! //random string < 10 length
     let suiteNumOfHost:Int? = Int(suiteNumOfHostTxt.text!) generic number
     */
}

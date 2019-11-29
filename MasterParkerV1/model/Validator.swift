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
        case password
    }

    func validatorFor(userInput: String, type: ValidatorType, bounds : Int = -1) -> Bool {
        self.userInput = userInput
        switch type {
            case .email: return self.genericValidator(regEx: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", errorMessage: "Invalid email format, must be : {localpart}@{domain}.com")
            
            case .genericNumber: return self.genericValidator(regEx: "[0-9]+", errorMessage: "Invalid input type, must be a number")
            
            case .numberWithinBounds : return self.genericValidator(regEx: "[0-9]+", errorMessage: "Number outside bounds, must be a number < \(bounds)", Bounds: bounds)
            
            case .password: return self.genericValidator(regEx: "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$", errorMessage: "The string must contain at least 1 lowercase alphabetical character \n The string must contain at least 1 uppercase alphabetical character \n The string must contain at least 1 numeric character \n The string must contain at least one special character, but we are escaping reserved RegEx characters to avoid conflict \n The string must be eight characters or longer")
            
        }
    }
    
    private func genericValidator(regEx : String, errorMessage: String, Bounds: Int = -1) -> Bool{
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        
        if(pred.evaluate(with: userInput)){//if userInput matches regex expression
            if(Bounds == -1){
                listOfErrorMessages.append("")//no errors
                return true
            }
            else{
                if(Int(userInput)! <= Bounds){
                    listOfErrorMessages.append("")
                    return true
                }
            }
        }
        listOfErrorMessages.append(errorMessage)//update error message
        return false
    }
    /*
    func EmailValidator() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(emailPred.evaluate(with: userInput)){//if email matches regex expression
            listOfErrorMessages.append("Invalid email format, must be : {localpart}@{domain}.com")
            return true
        }
        return false
    }
    
    func genericNumberValidator() -> Bool{
        let numberRegEx = "[0-9]+"

        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        if(numberPred.evaluate(with: userInput)){//if email matches regex expression
            listOfErrorMessages.append("Invalid input type, must be : number")
            return true
        }
        return false
    }
    */
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

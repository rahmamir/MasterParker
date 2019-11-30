
//
//  RegisterUser.swift
//  MasterParkerV1
//
//  Created by Moiz Khan on 11/22/19.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit

//MAKE FONT SAME AS IN STORYBOARD//

class RegisterUser : UIViewController {
    
    var userController = UserController()
    var validator = Validator()
    
    var creditCardErrorMessage : String = ""
    
    @IBOutlet var addProfileButton : UIButton!
    @IBOutlet var cardInfoButton : UIButton!
    @IBOutlet var emailLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var contactNumberLabel : UILabel!
    
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var contactNumberTextField : UITextField!
    @IBOutlet var carPlateNumberTextField : UITextField!
    
    
    
    var newPaymentModel = PaymentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCreditCardOnClick(){
        
        
        
        var alertMessage : String = ""
        
        if(creditCardErrorMessage == ""){
            alertMessage = "Enter Card Information"
        }
        
        let alert = UIAlertController(title: "Add New Credit Card",
        message: alertMessage,
        preferredStyle: .alert)
        // Login button
        let addCreditCardAction = UIAlertAction(title: "Add New Credit Card", style: .default, handler: { (action) -> Void in
            // Get TextFields text
            
            //update object payment
            let receivedCardNumberInfo = alert.textFields![0].text ?? ""
            let receivedCVVInfo = alert.textFields![1].text ?? ""
            let receivedNameInfo = alert.textFields![2].text ?? ""
            let receivedDateInfo = alert.textFields![3].text ?? ""
            
            if(self.verifyCreditCardInfo(cardNumber: receivedCardNumberInfo, cvv: receivedCVVInfo, date: receivedDateInfo)){
                
                //update cardInfo
                self.newPaymentModel.cvvNumber = Int(receivedCVVInfo)!
                self.newPaymentModel.cardName = receivedNameInfo
                self.newPaymentModel.cardNumber = Int(receivedCardNumberInfo)!
                self.newPaymentModel.expiryDate = receivedDateInfo
                
                self.cardInfoButton.setTitle("Card Added!", for: .normal)
                self.cardInfoButton.setTitleShadowColor(.green, for: .normal)
                self.addProfileButton.isEnabled = true
            }
            else{
                self.cardInfoButton.setTitle("Incorrect Card Info! Retry", for: .normal)
                self.cardInfoButton.setTitleShadowColor(.red, for: .normal)
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })

        // Add 1 textField (for credit car number)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type your Credit Card#"
            textField.textColor = UIColor.blue
        }
        
        // Add 2nd textField (for cvv)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.placeholder = "Type your CVV: XXX"
            textField.isSecureTextEntry = true
            textField.textColor = UIColor.blue
        }
        
        // Add 3rd textField (for card no.)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .numberPad
            textField.placeholder = "Type your Card Name"
            textField.textColor = UIColor.blue
        }
        
        // Add 3rd textField (for ExpiryDate no.)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.placeholder = "Type your Expiry Date : mm/yyyy"
            textField.textColor = UIColor.blue
        }
        
        // Add action buttons and present the Alert
        alert.addAction(addCreditCardAction)
        alert.addAction(cancel)
        //alert.view.layoutIfNeeded() //avoid Snapshotting error
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addNewUserOnClick(){
        
        if(verifyNewUserData()){
                let newName = nameTextField.text!
                let newEmail = emailTextField.text!
                let newPassword = passwordTextField.text!
                let newContactNumber = Int(contactNumberTextField.text!)
                let newCarPlateNumber = carPlateNumberTextField.text!
            
                let newlyCreatedUser = UserModel(Name: newName, Email: newEmail, Password: newPassword, ContactNumber: newContactNumber!, CarPlateNumber: newCarPlateNumber, PaymentModel: newPaymentModel)
               
                userController.insertUser(newUser: newlyCreatedUser)
               
                navigateToSignIn()
        }
    }

    private func verifyCreditCardInfo(cardNumber: String, cvv: String, date: String) -> Bool{
        
        print(cardNumber)
        print(cardNumber.count)
        print(cvv)
        print(cvv.count)
        print(date)
        
        let isCardNumberValid = validator.validatorFor(userInput: cardNumber, type: Validator.ValidatorType.numberWithCharacterCount, characterCount: 16)
        
        let isCvvValid = validator.validatorFor(userInput: cvv, type: Validator.ValidatorType.numberWithCharacterCount, characterCount: 3)
        
        let isDateValid = validator.validatorFor(userInput: date, type: Validator.ValidatorType.dateMonthAndYear)
        
        if(!isCardNumberValid){
            print("Card number invalid")
        }
        if(!isCvvValid){
            print("Cvv invalid")
        }
        if(!isDateValid){
            print("date invalid")
        }
         //reset error messages
        creditCardErrorMessage = "1.\(validator.listOfErrorMessages[0])\n2.\(validator.listOfErrorMessages[1])\n3.\(validator.listOfErrorMessages[2])\n"
        
        print(creditCardErrorMessage)
        
        if(isCardNumberValid && isCvvValid && isDateValid){
            return true
        }
        return false
    }
    
    private func verifyNewUserData() -> Bool{
        let newEmail = emailTextField.text ?? ""
        let newPassword = passwordTextField.text ?? ""
        let newContactNumber = contactNumberTextField.text ?? ""
 
        //try to validate each input
        let isNewEmailValid = validator.validatorFor(userInput: newEmail, type: Validator.ValidatorType.email)
        
        let isNewPasswordValid = validator.validatorFor(userInput: newPassword, type: Validator.ValidatorType.password)
        
        let isNewContactNumberValid = validator.validatorFor(userInput: newContactNumber, type: Validator.ValidatorType.numberWithCharacterCount, characterCount: 10)
        
 
        if(isNewEmailValid && isNewPasswordValid && isNewContactNumberValid){
            validator.listOfErrorMessages = []
            return true
        }
        else{
            errorMessagePopUp(listOfErrors: validator.listOfErrorMessages)
        }
        validator.listOfErrorMessages = []
        return false
    }
    
    private func errorMessagePopUp(listOfErrors : [String]){
        let alert = UIAlertController(title: "Errors in User Input",
        message: "Email:\n\(listOfErrors[0])\nPassword:\n\(listOfErrors[1])\nContact Number:\n\(listOfErrors[2])\n",
        preferredStyle: .alert)
        
        let retry = UIAlertAction(title: "Retry", style: .destructive, handler: { (action) -> Void in })
        
        alert.addAction(retry)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func navigateToSignIn(){
        
        let SignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInScene") as! SignInVC
        navigationController?.pushViewController(SignInVC, animated: true)
    }
}

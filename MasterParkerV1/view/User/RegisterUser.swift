
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
    
    @IBOutlet var emailLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var contactNumberLabel : UILabel!
    
    @IBOutlet var nameTextField : UITextField!
    
    @IBOutlet var emailTextField : UITextField!
    
    @IBOutlet var passwordTextField : UITextField!
    
    @IBOutlet var contactNumberTextField : UITextField!
    
    @IBOutlet var carPlateNumberTextField : UITextField!
    
    @IBOutlet var isCreditCardAdded : UILabel!
    
    var newPaymentModel = PaymentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCreditCardOnClick(){
        
        let alert = UIAlertController(title: "Add New Credit Card",
        message: "Insert Credit Card Number, CVV and Name",
        preferredStyle: .alert)
        
        // Login button
        let addCreditCardAction = UIAlertAction(title: "Add New Credit Card", style: .default, handler: { (action) -> Void in
            // Get TextFields text
            let receivedCardNumberInfo = alert.textFields![0]
            let receivedCVVInfo = alert.textFields![1]
            let receivedNameInfo = alert.textFields![2]
            let receivedDateInfo = alert.textFields![3]
            //NOTE= TRY TO HNADLE CREDIT CARD NUMBER VALIDATION

            //let cardNumberEntered = receivedCardNumberInfo.text
            
            self.newPaymentModel.cvvNumber = Int(String(receivedCVVInfo.text!))!
            self.newPaymentModel.cardName = receivedNameInfo.text ?? ""
            self.newPaymentModel.cardNumber = Int(String(receivedCardNumberInfo.text!))!
            self.newPaymentModel.expiryDate = receivedDateInfo.text ?? ""
            
            self.isCreditCardAdded.text = "\(receivedNameInfo)-\(receivedCardNumberInfo)-\(receivedDateInfo)"
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })

        // Add 1 textField (for username)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type your Credit Card#"
            textField.textColor = UIColor.blue
        }
        
        // Add 2nd textField (for password)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.placeholder = "Type your CVV: XXX"
            textField.isSecureTextEntry = true
            textField.textColor = UIColor.blue
        }
        
        // Add 3rd textField (for phone no.)
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
            textField.placeholder = "Type your Expiry Date : mm/yy"
            textField.textColor = UIColor.blue
        }
        
        // Add action buttons and present the Alert
        alert.addAction(addCreditCardAction)
        alert.addAction(cancel)
        alert.view.layoutIfNeeded() //avoid Snapshotting error
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
    
    private func verifyNewUserData() -> Bool{
        let newEmail = emailTextField.text ?? ""
        let newPassword = passwordTextField.text ?? ""
        let newContactNumber = contactNumberTextField.text ?? ""
 
        //try to validate each input
        let isNewEmailValid = validator.validatorFor(userInput: newEmail, type: Validator.ValidatorType.email)
        
        let isNewPasswordValid = validator.validatorFor(userInput: newPassword, type: Validator.ValidatorType.password)
        
        let isNewContactNumberValid = validator.validatorFor(userInput: newContactNumber, type: Validator.ValidatorType.numberWithCharacterCount, characterCount: 10)
        
        //update potential errors in input
        
        //emailLabel.text = "Email: \(validator.listOfErrorMessages[0])"
        //passwordLabel.text = "Password: \(validator.listOfErrorMessages[1])"
        //contactNumberLabel.text = "Contact Number: \(validator.listOfErrorMessages[2])"
        
        //reset error messages
        
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

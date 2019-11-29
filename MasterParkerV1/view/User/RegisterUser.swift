
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
        let newName = nameTextField.text!
        let newEmail = emailTextField.text!
        let newPassword = passwordTextField.text!
        let newContactNumber = Int(contactNumberTextField.text!)
        let newCarPlateNumber = carPlateNumberTextField.text!
        
        let newlyCreatedUser = UserModel(Name: newName, Email: newEmail, Password: newPassword, ContactNumber: newContactNumber!, CarPlateNumber: newCarPlateNumber, PaymentModel: newPaymentModel)
        
        userController.insertUser(newUser: newlyCreatedUser)
        /*
        if newlyCreatedUser != nil{
                userController.insertUser(newUser: newlyCreatedUser)
                            userController.verifySameCarPlateNum(email: newName, carPlateNumber: newCarPlateNumber)
                var allUsers = (self.userController.getAllUsers() ?? nil)!
                                   
                if (allUsers != nil){
                for user in allUsers{
                print("Name: ", user.value(forKey: "name") as! String, " ",
               "Email: ", user.value(forKey: "email") as! String, " ",
               "Password: ", user.value(forKey: "password") as! String, " ",
               "Contact Number: ", user.value(forKey: "contactNumber") as! Int, " ",
               "Car Plate Number: ", user.value(forKey: "carPlateNumber") as! String, " ")
                 }
             }
            _ = navigationController?.popViewController(animated: true)
          }
              else
              {
              print("User creation unsuccessful");
              }
        */
        navigateToSignIn()
    }
    
    private func navigateToSignIn(){
        
        let SignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInScene") as! SignInVC
        navigationController?.pushViewController(SignInVC, animated: true)
    }
}

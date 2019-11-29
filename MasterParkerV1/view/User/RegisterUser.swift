
//
//  RegisterUser.swift
//  MasterParkerV1
//
//  Created by Moiz Khan on 11/22/19.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit



class RegisterUser : UIViewController {
    
    var userController = UserController()
    
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
    
    @IBAction func addCreditCardOnClick(){ /*https:/code.tutsplus.com/tutorials/create-a-custom-alert-controller-in-ios-10-swift-3--cms-27589
            */
        
        let alert = UIAlertController(title: "Add New Credit Car",
        message: "Insert Credit Card Number, CVV and Name",
        preferredStyle: .alert)
        
        // Login button
        let addCreditCardAction = UIAlertAction(title: "Add New Credit Car", style: .default, handler: { (action) -> Void in
            // Get TextFields text
            let receivedCardNumberInfo = alert.textFields![0]
            let receivedCVVInfo = alert.textFields![1]
            let receivedNameInfo = alert.textFields![2]
             
            //print("USERNAME: \(usernameTxt.text!)\nPASSWORD: \(passwordTxt.text!)\nPHONE NO.: \(phoneTxt.text!)")
            
            self.newPaymentModel.cvvNumber = Int(String(receivedCVVInfo.text!))!
            self.newPaymentModel.nameOnCard = receivedNameInfo.text ?? ""
            self.newPaymentModel.cardNumber = Int(String(receivedCardNumberInfo.text!))!
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })

        // Add 1 textField (for username)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type your Credit Card#"
            textField.textColor = UIColor.green
        }
        
        // Add 2nd textField (for password)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.placeholder = "Type your CVV"
            textField.isSecureTextEntry = true
            textField.textColor = UIColor.red
        }
        
        // Add 3rd textField (for phone no.)
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .numberPad
            textField.placeholder = "Type your Name"
            textField.textColor = UIColor.blue
            textField.font = UIFont(name: "AmericanTypewriter", size: 14)
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
        
        let newlyCreatedUser = UserModel(Name: newName, Email: newEmail, Password: newPassword, ContactNumber: newContactNumber!, CarPlateNumber: newCarPlateNumber)
        
        //print("USERNAME: \(newlyCreatedUser.name)\nPASSWORD: \(newlyCreatedUser.password)\n EMAIL: \(newlyCreatedUser.email)")
        
        //print("\(newlyCreatedUser.paymentModel.cardNumber)\n")
        //print("\(newlyCreatedUser.paymentModel.cvvNumber)\n")
        //print("\(newlyCreatedUser.paymentModel.expiryDate)\n")
        //print("\(newlyCreatedUser.paymentModel.nameOnCard)\n")
        
        userController.insertUser(newUser: newlyCreatedUser)
        navigateToSignIn()
    }
    
    private func navigateToSignIn(){
        
        let SignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInScene") as! SignInVC
               
        navigationController?.pushViewController(SignInVC, animated: true)
    }
}

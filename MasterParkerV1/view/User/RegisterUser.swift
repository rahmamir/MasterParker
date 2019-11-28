
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
            let usernameTxt = alert.textFields![0]
            let passwordTxt = alert.textFields![1]
            let phoneTxt = alert.textFields![2]
             
            print("USERNAME: \(usernameTxt.text!)\nPASSWORD: \(passwordTxt.text!)\nPHONE NO.: \(phoneTxt.text!)")
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
        self.present(alert, animated: true, completion: nil)
        
      
    }
}

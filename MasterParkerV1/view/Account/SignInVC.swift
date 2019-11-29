//
//  SignInVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class SignInVC : UIViewController{
    
    var userController = UserController()
    
    @IBOutlet var emailTextField : UITextField!
    
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
    @IBAction func onloginClick(_ sender: UIButton){

        let enteredEmail = emailTextField.text!
        let enteredPassword = passwordTextField.text!
        
        if(userController.isValidLogin(email: enteredEmail, password: enteredPassword)){
                
            let homeScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenScene") as! HomeScreenVC
            
                var loggedInCarplateNumber = userController.returnCarPlateFromEmail(email: enteredEmail)
                UserDefaults.standard.set(loggedInCarplateNumber, forKey: "LOGGEDINCARPLATENUMBER")
                navigationController?.pushViewController(homeScreenVC, animated: true)
        }
    }
    
    @IBAction func onSignUpClick(_ sender: UIButton) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpScene") as! RegisterUser
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}

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

    @IBOutlet var rememberCredentialsSwitch : UISwitch!
    
    @IBOutlet var emailTextField : UITextField!
    
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           grabSavedLoginCredentials()
       }
    
    func saveLoginCredentials(EnteredEmail: String, EnteredPassword: String){
        if(rememberCredentialsSwitch.isEnabled){//save login cred.
            UserDefaults.standard.set(EnteredEmail, forKey: "SAVEDEMAIL")
            UserDefaults.standard.set(EnteredPassword, forKey: "SAVEDPASSWORD")
        }
        else{
           UserDefaults.standard.set("", forKey: "SAVEDEMAIL")
           UserDefaults.standard.set("", forKey: "SAVEDPASSWORD")
        }
    }
    
    func grabSavedLoginCredentials(){
        let savedEmail = UserDefaults.standard.value(forKey: "SAVEDEMAIL") as? String
        let savedPassword = UserDefaults.standard.value(forKey: "SAVEDPASSWORD") as? String
        if(!(savedEmail==nil || savedPassword==nil)){
            emailTextField.text = savedEmail
            passwordTextField.text = savedPassword
        }
        
    }
    
    @IBAction func onloginClick(_ sender: UIButton){

        let enteredEmail = emailTextField.text!
        let enteredPassword = passwordTextField.text!
        
        if(userController.isValidLogin(email: enteredEmail, password: enteredPassword)){
            
            saveLoginCredentials(EnteredEmail: enteredEmail, EnteredPassword: enteredPassword)
            
            let loggedInCarplateNumber = userController.returnCarPlateFromEmail(email: enteredEmail)
            UserDefaults.standard.set(loggedInCarplateNumber, forKey: "LOGGEDINCARPLATENUMBER")
            UserDefaults.standard.set(enteredEmail, forKey: "LOGGEDINUSEREMAIL")

            let homeScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenScene") as! HomeScreenVC

            navigationController?.pushViewController(homeScreenVC, animated: true)
        }
        else{//invalid credentials//create an alert
            let alert = UIAlertController(title: "Login Error",
            message: "Please enter the correct username and password",
            preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
            
            alert.addAction(cancel)
            alert.view.layoutIfNeeded() //avoid Snapshotting error
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func onSignUpClick(_ sender: UIButton) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpScene") as! RegisterUser
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}

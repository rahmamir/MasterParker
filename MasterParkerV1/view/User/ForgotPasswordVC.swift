//
//  ForgotPasswordVC.swift
//  MasterParkerV1
//
//  Created by Moiz Khan on 12/13/19.
//  Copyright © 2019 MR. All rights reserved.
//
//
import UIKit

class ForgotPasswordVC : UIViewController{
    
    var userController = UserController()
    var homeScreenVC = HomeScreenVC()


    @IBOutlet var emailTextField : UITextField!
    
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    
    @IBAction func onForgotPassword(_ sender: UIButton){

        let enteredEmail = emailTextField.text!
        let enteredPassword = passwordTextField.text!
        
        let currentUser = userController.grabUser(email: enteredEmail as! String)
        
        if(currentUser.email == enteredEmail){
            
          currentUser.password = enteredPassword
          
          userController.updateUser(user: currentUser)
            
            let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInScene") as! SignInVC
            
            navigationController?.pushViewController(signInVC, animated: true)
        }
        else{//invalid credentials//create an alert
            let alert = UIAlertController(title: "Login Error",
            message: "Please enter the correct email to update your password",
            preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
            
            alert.addAction(cancel)
            alert.view.layoutIfNeeded() //avoid Snapshotting error
            self.present(alert, animated: true, completion: nil)
        }
    }

    
}

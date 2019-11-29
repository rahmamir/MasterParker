//
//  UpdateProfileVC.swift
//  MasterParkerV1
//
//  Created by Syed Rehan on 2019-11-29.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class UpdateProfileVC: UIViewController {

    var userController = UserController()
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtContactNumber: UITextField!
    
    @IBOutlet weak var txtCarPlateNumber: UITextField!
    
    @IBAction func onUpdateProfileClick(_ sender: UIButton) {
        
        
        // Check who is logged in
        let name = txtName.text!
        let email = txtEmail.text!
        let password = txtPassword.text!
        let contactNumber = Int(txtContactNumber.text!)!
        let carPlateNumber = txtCarPlateNumber.text!
        
        userController.updateUser(user: UserModel(Name: name, Email: email, Password: password, ContactNumber: contactNumber, CarPlateNumber: carPlateNumber))
        
        var allUsers = (self.userController.getAllUsers() ?? nil)!
                                   
                if (allUsers != nil){
                for user in allUsers{
                print("Name Updated: ", user.value(forKey: "name") as! String, " ",
               "Email Updated: ", user.value(forKey: "email") as! String, " ",
               "Password Updated: ", user.value(forKey: "password") as! String, " ",
               "Contact Number Updated: ", user.value(forKey: "contactNumber") as! Int, " ",
               "Car Plate Number Updated: ", user.value(forKey: "carPlateNumber") as! String, " ")
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
/*
    @IBAction func doUpdateProfile(){
           //check who is logged in
           let email = txtUsername.text!
           let password = txtPassword.text!
           
           userController.updateUser(user: User(fname: "JK", lname: "P", email: email, phone: "1234", gender: 1, bdate: Date(), street: "McLaghlin", city: "Brampton", postal: "L1K2L3", password: password)!)
       }
 */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

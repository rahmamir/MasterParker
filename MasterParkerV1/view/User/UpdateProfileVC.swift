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
        
        let currentUserEmail = UserDefaults.standard.value(forKey: "LOGGEDINUSEREMAIL")
        
        let currentUser = userController.grabUser(email: currentUserEmail as! String)
        
        currentUser.name = txtName.text!
        currentUser.password = txtPassword.text!
        currentUser.contactNumber = Int(txtContactNumber.text!)!
        currentUser.carPlateNumber = txtCarPlateNumber.text!
        
        userController.updateUser(user: currentUser)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUserEmail = UserDefaults.standard.value(forKey: "LOGGEDINUSEREMAIL")
        
        let currentUser = userController.grabUser(email: currentUserEmail as! String)
        
        txtName.text = currentUser.name
        txtEmail.text = currentUser.email
        txtPassword.text = currentUser.password
        txtContactNumber.text = String(currentUser.contactNumber)
        txtCarPlateNumber.text = currentUser.carPlateNumber
    }


}

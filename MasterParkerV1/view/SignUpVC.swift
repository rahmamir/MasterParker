//
//  SignUpVC.swift
//  MasterParkerV1
//
//  Created by Syed Rehan on 2019-11-08.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    
    @IBOutlet weak var txtEmailAddress: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtContactNumber: UITextField!
    
    @IBOutlet weak var txtCarPlateNumber: UITextField!
    
    @IBOutlet weak var txtPaymentInfo: UITextField!
    
    let userController = UserController()
    
    @IBAction func onLoginClick()
    {
        let name = txtName.text!
        let lname = txtEmailAddress.text!
        let email = txtPassword.text!
        let phone = txtContactNumber.text!
        let street = txtCarPlateNumber.text!
        let city = txtPaymentInfo.text!
    }
        
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

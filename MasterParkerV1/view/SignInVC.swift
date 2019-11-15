//
//  SignInVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class SignInVC : UIViewController{
    

    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           
       }
    
    @IBAction func onloginClick(_ sender: UIButton){

        let homeScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenScene") as! HomeScreenVC
        
        navigationController?.pushViewController(homeScreenVC, animated: true)
        
    }
    
}

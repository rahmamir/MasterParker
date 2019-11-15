//
//  SignInVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class SignInVC : UIViewController{
    
    @IBOutlet var loginBtn : UIButton!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           
       }
    
    @IBAction func loginBtnClick(_ sender: UIButton){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               
               let homeScreenVC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenScene") as! HomeScreenVC
               navigationController?.pushViewController(homeScreenVC, animated: true)
        
    }
    
}

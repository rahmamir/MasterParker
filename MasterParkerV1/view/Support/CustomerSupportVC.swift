//
//  CustomerSupportVC.swift
//  MasterParkerV1
//
//  Created by Moiz Khan on 11/29/19.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit
import CallKit
import MessageUI

class CustomerSupportVC: UIViewController{
    
    var supportNumber: String = "4161234567"
    var supportEmail:String = "support@masterparker.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callSupportAction(_ sender: UIButton) {
        
        //URL format
        let callString : String = "tel://\(self.supportNumber)"
        
        //convert string into URL
        let url = URL(string: callString)
        
        print("URL : \(url)")
        
        if UIApplication.shared.canOpenURL(url!){
            
            if #available(iOS 10, *){
                //for all versions of ios 10 onwards
                //if app is available to open the URL
                UIApplication.shared.open(url!)
            }else{
                UIApplication.shared.openURL(url!)
            }
        
        }else{
            print("Cant place a call right now, try again later!")
        }
    }
    
    @IBAction func emailSupportAction(_ sender: UIButton) {
        //any app that can send emails
        if let url = URL(string: "mailto:\(supportEmail)"){
            if #available(iOS 10.0,*){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
        }
        
    }
}


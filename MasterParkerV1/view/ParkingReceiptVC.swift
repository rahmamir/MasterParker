//
//  ParkingReceiptVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class ParkingReceiptVC: UIViewController {

    let loggedInUser = UserModel(Name: "test", Email: "test", Password: "pass", ContactNumber: "23", CarPlateNumber: "2323")//TO DO LATER = access this through USER DEFAULTS!!!!!!!!!!!
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
        self.generateReceipt()
          // Do any additional setup after loading the view.
      }
    
    private func generateReceipt(){
        
        
        
    }
    
}

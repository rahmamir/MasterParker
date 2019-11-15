//
//  HomeScreenVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class HomeScreenVC : UIViewController {
    
    @IBOutlet var AddParkingBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onAddParkingClick(_ sender: UIButton){
        
        self.navigateTo()
        
    }
    
    private func navigateTo(){//TODO = dynamically navigate to appropriate page given appropriate parameters
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let addParkingVC = storyBoard.instantiateViewController(withIdentifier: "AddParkingScene") as! AddParkingVC
        navigationController?.pushViewController(addParkingVC, animated: true)
        
    }
    
}

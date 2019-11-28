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
    
    @IBAction func onAddParkingAction(_ sender: UIButton){
        
        let addParkingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddParkingScene") as! AddParkingVC
        
        navigationController?.pushViewController(addParkingVC, animated: true)
    }
    
    @IBAction func onViewReceiptParkingListAction(_ sender: UIButton){
        
        let parkingReceiptListTVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ParkingReceiptListTVCScene") as! ParkingReceiptListTVC
               
        navigationController?.pushViewController(parkingReceiptListTVC, animated: true)
        
    }
    
    @IBAction func viewParkingMapAction(_ sender: UIButton) {
    }
    
    
    @IBAction func viewUserProfileAction(_ sender: UIButton) {
    }
    
    @IBAction func viewCustomerSupportAction(_ sender: Any) {
    }
    
    @IBAction func viewParkingManualAction(_ sender: Any) {
    }
    
    @IBAction func signOutAction(_ sender: UIButton) {
    }
    
    
    
}

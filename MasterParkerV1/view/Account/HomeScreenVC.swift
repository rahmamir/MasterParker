//
//  HomeScreenVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class HomeScreenVC : UIViewController {
    
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
        let map = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ParkingMap") as! ParkingMapVC
                      
               navigationController?.pushViewController(map, animated: true)
               
    }
    
    
    @IBAction func viewUserProfileAction(_ sender: UIButton) {
    }
    
    @IBAction func viewCustomerSupportAction(_ sender: Any) {
    }
    
    @IBAction func viewParkingManualAction(_ sender: Any) {
        let appManual = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AppManual") as! AppManualVC
                    
             navigationController?.pushViewController(appManual, animated: true)
             
    }
    
    @IBAction func signOutAction(_ sender: UIButton) {
        let signOut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignIn") as! SignInVC
                           
                    navigationController?.pushViewController(signOut, animated: true)
                 
    }
    
    
    
}

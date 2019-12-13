//
//  ParkingReceiptVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class ParkingReceiptVC: UIViewController {

    //let newParking = ParkingModel(BuildingCode: 23, NumOfHours: 2, CarPlateNum: "sdsd", SuiteNumOfHost: 45, DateOfParking: Date(), parkingCharge: 900)//TO DO LATER = access this through USER DEFAULTS!!!!!!!!!!!
    let parkingController = ParkingController()
    
    @IBOutlet var carPlateNumberLabel : UILabel!
    
    @IBOutlet var timeOfParkingLabel : UILabel!
    
    @IBOutlet var durationOfParkingLabel : UILabel!
    
    @IBOutlet var buildingCodeLabel : UILabel!
    
    @IBOutlet var suiteNumOfHostLabel : UILabel!
    
    @IBOutlet var parkingCostLabel : UILabel!
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          self.generateReceipt()
      }
    @IBAction func goBackHomeAction(_ sender: UIButton) {
        let homeScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenScene") as! HomeScreenVC
               
        navigationController?.pushViewController(homeScreenVC, animated: true)
    }
    
    private func generateReceipt(){
        
        let newParking = parkingController.getParking(carplateNum: UserDefaults.standard.value(forKey: "LOGGEDINCARPLATENUMBER") as! String, dateOfParking: UserDefaults.standard.value(forKey: "SELECTEDDATE") as! Date)
    
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .short

        let dateString = dateFormatter.string(from: newParking.dateOfParking)
        
        carPlateNumberLabel.text = newParking.carPlateNum
        
        timeOfParkingLabel.text = dateString
        
        durationOfParkingLabel.text = String(newParking.numOfHours)
        
        buildingCodeLabel.text = String(newParking.buildingCode)
        
        suiteNumOfHostLabel.text = String(newParking.suiteNumOfHost)
        
        parkingCostLabel.text = String(newParking.parkingCharge)
        
    }
    
}

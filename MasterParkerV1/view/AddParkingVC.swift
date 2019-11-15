//
//  AddParkingVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-07.
//  Copyright © 2019 MR. All rights reserved.


import UIKit

class AddParkingVC: UIViewController {

    @IBOutlet var confirmParkingBtn : UIButton!
    
    @IBOutlet var buildingCodeTxt : UITextField!
    
    @IBOutlet var numOfHoursTxt : UITextField!
    
    @IBOutlet var carPlateNumberTxt : UITextField!
    
    @IBOutlet var suiteNumOfHostTxt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    func createParking(){
        
        let buildingCode = buildingCodeTxt.text as! Int
        let numOfHours = numOfHoursTxt.text
        let carPlateNum = carPlateNumberTxt.text
        let suiteNumOfHost = suiteNumOfHostTxt.text
        
        let newParking = ParkingModel(buildingCode: buildingCode)
    }

}


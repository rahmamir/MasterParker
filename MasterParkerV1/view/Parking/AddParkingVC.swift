//
//  AddParkingVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-07.
//  Copyright © 2019 MR. All rights reserved.


import UIKit

class AddParkingVC: UIViewController {

    let userController = UserController()
    let parkingController = ParkingController()
    let validator = Validator()
    
    @IBOutlet var buildingCodeTxt : UITextField!
    @IBOutlet var buildingCodeValidationLabel : UILabel!
    
    @IBOutlet var numOfHoursTxt : UITextField!
    @IBOutlet var numOfHoursValidationLabel : UILabel!
    
    @IBOutlet var carPlateNumberTxt : UITextField!
    
    @IBOutlet var suiteNumOfHostTxt : UITextField!
    @IBOutlet var suiteNumOfHostValidationLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let automaticCarPlate = UserDefaults.standard.value(forKey: "LOGGEDINCARPLATENUMBER") as? String
        carPlateNumberTxt.text = automaticCarPlate
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onConfirmParking(_ sender: UIButton) {
        print("Trying to add new parking")
        self.createParking()
    }
    
    private func createParking(){
        if(isUserInputValid()){
            let buildingCode:Int? = Int(buildingCodeTxt.text!)
            let numOfHours:Int? = Int(numOfHoursTxt.text!)
            let carPlateNum = carPlateNumberTxt.text!
            let suiteNumOfHost:Int? = Int(suiteNumOfHostTxt.text!)
            
            let storedEmailLoggedIn = UserDefaults.standard.value(forKey: "LOGGEDINUSEREMAIL") as! String
            
            if(userController.verifySameCarPlateNum(email: storedEmailLoggedIn, carPlateNumber: carPlateNum)){//if carplate of user == inputted carplate
                let date = Date()
                let parkingCharges = calculateParkingCharges(numOfHours: numOfHours!)
                
                if(parkingCharges != -1){
                        print("PARKINGCHARGES")
                        print(parkingCharges)
                        let newParking = ParkingModel(BuildingCode: buildingCode!, NumOfHours: numOfHours!, CarPlateNum: carPlateNum, SuiteNumOfHost: suiteNumOfHost!, DateOfParking: date, parkingCharge: parkingCharges)
                    
                       print("updating database with new parking")
                       parkingController.insertParking(newParking: newParking)//updated ParkingDatabase
                       //userController.updateUser(user: loggedInUser)//updated UserDatabase
                        UserDefaults.standard.set(carPlateNum, forKey: "LOGGEDINCARPLATENUMBER")
                        UserDefaults.standard.set(date, forKey: "SELECTEDDATE")
                       navigateToReceipt()//go to receipt page
                }
            }
        }
    }
    
    private func isUserInputValid() -> Bool{
        let buildingCode = buildingCodeTxt.text ?? ""
        let numOfHours = numOfHoursTxt.text ?? ""
        let suiteNumOfHost = suiteNumOfHostTxt.text ?? ""
        
        let isBuildingCodeValid = validator.validatorFor(userInput: buildingCode, type: Validator.ValidatorType.genericNumber)
        
        let buildingCodeinRange = validator.validatorFor(userInput: buildingCode, type: Validator.ValidatorType.buildingWithinRange)
        
        let isNumOfHoursValid = validator.validatorFor(userInput: numOfHours, type: Validator.ValidatorType.numberWithinBounds, bounds: 25)
        
        let isSuiteNumOfHostValid = validator.validatorFor(userInput: suiteNumOfHost, type: Validator.ValidatorType.genericNumber)
        
        buildingCodeValidationLabel.text = validator.listOfErrorMessages[0] +  "\n" + validator.listOfErrorMessages[0]

        numOfHoursValidationLabel.text = validator.listOfErrorMessages[2]
        suiteNumOfHostValidationLabel.text = validator.listOfErrorMessages[3]
        
        validator.listOfErrorMessages = []
        
        if(isBuildingCodeValid && isNumOfHoursValid && isSuiteNumOfHostValid && buildingCodeinRange){
            return true
        }
        return false
    }
    
    private func calculateParkingCharges(numOfHours: Int) -> Int{
        
        let currentCarPlateNumber = UserDefaults.standard.value(forKey: "LOGGEDINCARPLATENUMBER") as! String
        
        let totalParkingCharges = parkingController.isFreeParking(DateParked: Date(), CarPlateNumber: currentCarPlateNumber)
        
        if(totalParkingCharges){
            return 0
        }
        else{
            return regularCharges(numOfHours: numOfHours)
        }
        //UPDATE THE USER DEFAULTS USER OBJECT, UNLESS THAT OCCURS AUTOMATICALLY
    }
    
    private func regularCharges(numOfHours: Int) -> Int{
        print("NUM OF HOURS = ")
        print(numOfHours)
        if(numOfHours <= 1){
            return 4
        }
        else if(numOfHours <= 3){
            return 8
        }
        else if(numOfHours <= 10){
            return 12
        }
        else if(numOfHours <= 24){
            return 20
        }
        else{
            return -1
        }
    }
    
    private func navigateToReceipt(){
        
        let ParkingReceiptVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ParkingReceiptScene") as! ParkingReceiptVC
               
        navigationController?.pushViewController(ParkingReceiptVC, animated: true)
        
    }

}



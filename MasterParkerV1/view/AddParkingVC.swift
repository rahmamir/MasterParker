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
    let loggedInUser = UserModel(Name: "test", Email: "test", Password: "pass", ContactNumber: "23", CarPlateNumber: "2323")//TO DO LATER = access this through USER DEFAULTS!!!!!!!!!!!
    

    
    @IBOutlet var buildingCodeTxt : UITextField!
    
    @IBOutlet var numOfHoursTxt : UITextField!
    
    @IBOutlet var carPlateNumberTxt : UITextField!
    
    @IBOutlet var suiteNumOfHostTxt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onConfirmParking(_ sender: UIButton) {
        self.createParking()
    }
    
    private func createParking(){
        
        let buildingCode:Int? = Int(buildingCodeTxt.text!)
        let numOfHours:Int? = Int(numOfHoursTxt.text!)
        let carPlateNum = carPlateNumberTxt.text!
        let suiteNumOfHost:Int? = Int(suiteNumOfHostTxt.text!)
        
        //TODO = basic errorchecking with popup error messages, such as empty fields, or incorrect data type
        
        if(userController.verifySameCarPlateNum(name: loggedInUser.name, carPlateNumber: carPlateNum)){//if carplate of user == inputted carplate#
            
            let date = Date()
            let parkingCharges = calculateParkingCharges(numOfHours: numOfHours!, parkingCount: loggedInUser.numOfParkingsMade)
            
            let newParking = ParkingModel(BuildingCode: buildingCode!, NumOfHours: numOfHours!, CarPlateNum: carPlateNum, SuiteNumOfHost: suiteNumOfHost!, DateOfParking: date, parkingCharge: parkingCharges)
         
            parkingController.insertParking(newParking: newParking)//updated ParkingDatabase
            userController.updateUser(user: loggedInUser)//updated UserDatabase
            //UPDATE THE USER DEFAULTS USER OBJECT, UNLESS THAT OCCURS AUTOMATICALLY
            navigateToReceipt()//go to receipt page
        }
        navigateToReceipt()//DELETE THIS LINE LATER, ONLY FOR TESTING PURPOSES
    }
    
    private func calculateParkingCharges(numOfHours: Int, parkingCount: Int) -> Int{
        
        let userMonth = Calendar.current.component(.month, from: loggedInUser.currentMonth)
        let currentMonth = Calendar.current.component(.month, from: Date())
        
        if(currentMonth == userMonth){
            if(parkingCount <= 3){
                loggedInUser.numOfParkingsMade = loggedInUser.numOfParkingsMade + 1
                return 0//free if the first 3 parkings of month
            }
            else{
                return regularCharges(numOfHours: numOfHours)
            }
        }
        else{
            loggedInUser.numOfParkingsMade = 1//reset free parking count, +1 for current parking
            loggedInUser.currentMonth = Date()//update the current month of the user
            return 0//0 if first parking made
        }
        //UPDATE THE USER DEFAULTS USER OBJECT, UNLESS THAT OCCURS AUTOMATICALLY
    }
    
    private func regularCharges(numOfHours: Int) -> Int{
        switch numOfHours {
        case 1:
            return 4
        case 3:
            return 8
        case 10:
            return 12
        case 24:
            return 20
        default:
            return -1
        }
    }
    
    private func navigateToReceipt(){
        
        let ParkingReceiptVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ParkingReceiptScene") as! ParkingReceiptVC
               
        navigationController?.pushViewController(ParkingReceiptVC, animated: true)
        
    }

}


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
        print("Trying to add new parking")
        self.createParking()
    }
    
    private func createParking(){
        
        let buildingCode:Int? = Int(buildingCodeTxt.text!)
        let numOfHours:Int? = Int(numOfHoursTxt.text!)
        let carPlateNum = carPlateNumberTxt.text!
        let suiteNumOfHost:Int? = Int(suiteNumOfHostTxt.text!)
        
        //TODO = basic errorchecking with popup error messages, such as empty fields, or incorrect data type
        
        //if(userController.verifySameCarPlateNum(name: loggedInUser.name, carPlateNumber: carPlateNum)){//if carplate of user == inputted carplate#UNCOMMENT THIS
            //parkingController.deleteAllParkings()
            let date = Date()
            let parkingCharges = calculateParkingCharges(numOfHours: numOfHours!)
        
        if(parkingCharges != -1){
                print("PARKINGCHARGES")
                print(parkingCharges)
                let newParking = ParkingModel(BuildingCode: buildingCode!, NumOfHours: numOfHours!, CarPlateNum: carPlateNum, SuiteNumOfHost: suiteNumOfHost!, DateOfParking: date, parkingCharge: parkingCharges)
            
               UserDefaults.standard.set(carPlateNum, forKey: "CARPLATENUMBER")
               UserDefaults.standard.set(date, forKey: "DATEOFPARKING")
               
               print("updating database with new parking")
               parkingController.insertParking(newParking: newParking)//updated ParkingDatabase
               //userController.updateUser(user: loggedInUser)//updated UserDatabase
               //UPDATE THE USER DEFAULTS USER OBJECT, UNLESS THAT OCCURS AUTOMATICALLY
               navigateToReceipt()//go to receipt page
        }
        //}//UNCOMMENT THIS
    }
    
    private func calculateParkingCharges(numOfHours: Int) -> Int{
        
        //let userMonth = Calendar.current.component(.month, from: loggedInUser.currentMonth)
        //let currentMonth = Calendar.current.component(.month, from: Date())
        
        let totalParkingCharges = parkingController.isFreeParking(DateParked: Date())
        
        if(totalParkingCharges){
            return 0
        }
        else{
            return regularCharges(numOfHours: numOfHours)
        }
        //UPDATE THE USER DEFAULTS USER OBJECT, UNLESS THAT OCCURS AUTOMATICALLY
        return 0
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



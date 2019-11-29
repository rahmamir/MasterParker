//
//  ParkingReceiptListTVC.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit

class ParkingReceiptListTVC : UITableViewController{
    
    //carplate - ###
    //date and time - ###
    //suite no - ####
    
    //let loggedInUser = UserModel(Name: "test", Email: "test", Password: "pass", ContactNumber: 123, CarPlateNumber: "2323")//TO DO LATER = access this through USER DEFAULTS!!!!!!!!!!!
    let parkingController = ParkingController()
    var mParkingList = [ParkingModel]()
   
    override func viewDidLoad() {
           super.viewDidLoad()
            //self.tableView.register(ParkingReceiptTVCell.self, forCellReuseIdentifier: "cell")
            self.fetchParkings()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mParkingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ParkingReceiptTVCell
                
        // Configure the cell...
        cell.carPlateNumber!.text = "CarPlate#: \(self.mParkingList[indexPath.row].carPlateNum)"
        cell.dateOfParking!.text = "Date of Parking: \(self.mParkingList[indexPath.row].dateOfParking)"
         
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let parkingReceiptVC = mainSB.instantiateViewController(identifier: "ParkingReceiptScene") as! ParkingReceiptVC
        
        UserDefaults.standard.set(mParkingList[indexPath.row].carPlateNum, forKey: "SELECTEDCARPLATENUMBER")
        UserDefaults.standard.set(mParkingList[indexPath.row].dateOfParking, forKey: "SELECTEDDATE")
        
        //send the current contact to next scene
        self.navigationController?.pushViewController(parkingReceiptVC, animated: true)
    }
    
    private func fetchParkings(){
        
        
        let currentCarPlateNumber = UserDefaults.standard.value(forKey: "LOGGEDINCARPLATENUMBER") as! String
        
        print("currentCarPlateNumber= \(currentCarPlateNumber)")
        
        mParkingList = (parkingController.getAllParkingsForCarPlateNumber(carPlateNumber: currentCarPlateNumber))
        
        mParkingList.sort { (parkingModelA: ParkingModel, parkingModelB: ParkingModel) -> Bool in
            if(parkingModelB.dateOfParking < parkingModelA.dateOfParking ){
                return true
            }
            return false
        }
        
        print(mParkingList.count)
        self.tableView.reloadData()
    }
    
}

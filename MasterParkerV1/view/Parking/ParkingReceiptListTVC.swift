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
    
    let loggedInUser = UserModel(Name: "test", Email: "test", Password: "pass", ContactNumber: "23", CarPlateNumber: "2323")//TO DO LATER = access this through USER DEFAULTS!!!!!!!!!!!
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
        
        //print(indexPath.row)
        //print(mParkingList.count)
        //print(mParkingList[0].carPlateNum)
        //print(cell.carPlateNumber)
        
        // Configure the cell...
        cell.carPlateNumber!.text = "\(self.mParkingList[indexPath.row].carPlateNum)"
         
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let parkingReceiptVC = mainSB.instantiateViewController(identifier: "ParkingReceiptScene") as! ParkingReceiptVC
        
        UserDefaults.standard.set(mParkingList[indexPath.row].carPlateNum, forKey: "CARPLATENUMBER")
        
        //send the current contact to next scene
        self.navigationController?.pushViewController(parkingReceiptVC, animated: true)
    }
    
    private func fetchParkings(){
        
        //var allUsers = (parkingController.getAllParkingsForCarPlateNumber(carPlateNumber: loggedInUser.carPlateNumber) ?? nil)!
        mParkingList = (parkingController.getAllParkingsForCarPlateNumber(carPlateNumber: "2323") )
        
        print(mParkingList.count)
        self.tableView.reloadData()
    }
    
}

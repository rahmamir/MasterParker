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
    
   
    let parkingController = ParkingController()
    var mParkingList = [ParkingModel]()
   
    override func viewDidLoad() {
           super.viewDidLoad()
           
            self.fetchParkings()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mParkingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ParkingReceiptTVCell
                
        let currentDate = self.mParkingList[indexPath.row].dateOfParking
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "MMM d, h:mm a"

        let dateString = dateFormatter.string(from: currentDate)
        
        //
        cell.carPlateNumber!.text = "CarPlate: \(self.mParkingList[indexPath.row].carPlateNum)"
        cell.dateOfParking!.text = "Date: \(dateString)"
         
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let parkingReceiptVC = mainSB.instantiateViewController(identifier: "ParkingReceiptScene") as! ParkingReceiptVC
        
        UserDefaults.standard.set(mParkingList[indexPath.row].carPlateNum, forKey: "SELECTEDCARPLATENUMBER")
        UserDefaults.standard.set(mParkingList[indexPath.row].dateOfParking, forKey: "SELECTEDDATE")
        
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

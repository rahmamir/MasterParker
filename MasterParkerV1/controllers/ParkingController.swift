//
//  ParkingController.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class ParkingController
{
    func deleteAllParkings(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Parking")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        do {
            try managedObjectContext.execute(batchDeleteRequest)
        } catch {
            // Error Handling
        }
        /*
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
       {
           return
       }
       let managedContext = appDelegate.persistentContainer.viewContext
       let parkingEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Parking", in: managedContext)
        if (parkingEntity != nil){
            let parking = NSManagedObject(entity: parkingEntity!, insertInto: managedContext)
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Parking")
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try managedContext.fetch(fetchRequest)
                for parking in results {
                    let managedObjectData:NSManagedObject = parking as! NSManagedObject
                    managedContext.delete(managedObjectData)
                }
                
            }catch let error as NSError{
                print("Insert parking failed...\(error), \(error.userInfo)")
            }
        }
         */
    }
    
    func insertParking(newParking: ParkingModel)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let parkingEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Parking", in: managedContext)
        //if we have access to user table
        if (parkingEntity != nil){
            let user = NSManagedObject(entity: parkingEntity!, insertInto: managedContext)
            user.setValue(newParking.buildingCode, forKey: "buildingCode")
            user.setValue(newParking.carPlateNum, forKey: "carPlateNum")
            user.setValue(newParking.numOfHours, forKey: "numOfHours")
            user.setValue(newParking.suiteNumOfHost, forKey: "suiteNumOfHost")
            user.setValue(newParking.dateOfParking, forKey: "dateOfParking")
            user.setValue(newParking.parkingCharge, forKey: "parkingCharge")
            do{
                //to perform insert operation on database table
                print("successfully adding parking to database")
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert parking failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    func getAllParkings() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Parking")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
    
    func getAllParkingsForCarPlateNumber(carPlateNumber: String) -> [ParkingModel]{
        
        let allParkings = (self.getAllParkings() ?? nil)!
        var previousParkings = [ParkingModel]()
        
        if(allParkings != nil){
            for parking in allParkings{
                let dbCarPlateNumber = parking.value(forKey: "carPlateNum") as! String
                if(carPlateNumber == dbCarPlateNumber){
                    let tempParking = ParkingModel(
                        BuildingCode: parking.value(forKey: "buildingCode") as! Int,
                        NumOfHours: parking.value(forKey: "numOfHours") as! Int,
                        CarPlateNum: parking.value(forKey: "carPlateNum") as! String,
                        SuiteNumOfHost: parking.value(forKey: "suiteNumOfHost") as! Int,
                        DateOfParking: parking.value(forKey: "dateOfParking") as! Date,
                        parkingCharge: parking.value(forKey: "parkingCharge") as! Int)
                    
                        previousParkings.append(tempParking)
                }
            }
        }
        return previousParkings
    }
    
    func getParking(carplateNum: String, dateOfParking: Date) -> ParkingModel{
        
        let allParkings = (self.getAllParkings() ?? nil)!
        var specificParking : ParkingModel
        
        if(allParkings != nil){
            for parking in allParkings{
                //let dbCarPlateNumber = parking.value(forKey: "carPlateNumber") as! String
                //if(carPlateNumber == dbCarPlateNumber){
                if(parking.value(forKey: "carPlateNum") as! String == carplateNum &&
                    parking.value(forKey: "dateOfParking") as! Date == dateOfParking){
                    specificParking = ParkingModel(
                                       BuildingCode: parking.value(forKey: "buildingCode") as! Int,
                                       NumOfHours: parking.value(forKey: "numOfHours") as! Int,
                                       CarPlateNum: parking.value(forKey: "carPlateNum") as! String,
                                       SuiteNumOfHost: parking.value(forKey: "suiteNumOfHost") as! Int,
                                       DateOfParking: parking.value(forKey: "dateOfParking") as! Date,
                                       parkingCharge: parking.value(forKey: "parkingCharge") as! Int)
                    return specificParking
                }
            }
        }
        return ParkingModel(BuildingCode: -1, NumOfHours: -1, CarPlateNum: "-1", SuiteNumOfHost: -1, DateOfParking: Date(), parkingCharge: -1)
    }
    
    func isFreeParking(DateParked: Date, CarPlateNumber: String) -> Bool{
        
        let allParkings = (self.getAllParkings() ?? nil)!
        var currentMonthParkCount = 0
        
        if(allParkings != nil){
            for parking in allParkings{
                let dbCarPlateNum = parking.value(forKey: "carPlateNum") as! String
                if(dbCarPlateNum==CarPlateNumber){
                   let tempDate = parking.value(forKey: "dateOfParking") as! Date
                   let calendar = Calendar.current
                   let tempMonth = calendar.component(.month, from: tempDate)
                   let monthParked = calendar.component(.month, from: DateParked)
                   
                   print("monthParked=\(monthParked)")
                   print("tempMonth=\(tempMonth)")
                   if(monthParked == tempMonth){
                       currentMonthParkCount += 1
                   }
                }
            }
        }
        //print(currentMonthParkCount)
        if(currentMonthParkCount < 3){
            print("FREE PARKING")
            return true
        }
        print("EXPENSIVE PARKING")
        return false
    }
}

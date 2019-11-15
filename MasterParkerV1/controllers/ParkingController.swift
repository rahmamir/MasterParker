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
    func insertParking(newParking: ParkingModel)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let parkingEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "ParkingEntity", in: managedContext)
        //if we have access to user table
        if (parkingEntity != nil){
            let user = NSManagedObject(entity: parkingEntity!, insertInto: managedContext)
            user.setValue(newParking.buildingCode, forKey: "buildingCode")
            user.setValue(newParking.carPlateNum, forKey: "carPlateNum")
            user.setValue(newParking.numOfHours, forKey: "numOfHours")
            user.setValue(newParking.suiteNumOfHost, forKey: "suiteNumOfHost")
            do{
                //to perform insert operation on database table
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ParkingEntity")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
}

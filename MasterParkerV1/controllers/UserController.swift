//
//  UserController.swift
//  MasterParkerV1
//
//  Created by Syed Rehan on 2019-11-12.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class UserController
{
    func insertUser(newUser: UserModel)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)
        //if we have access to user table
        if (userEntity != nil){
            let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
            user.setValue(newUser.name, forKey: "name")
            user.setValue(newUser.email, forKey: "email")
            user.setValue(newUser.password, forKey: "password")
            user.setValue(newUser.contactNumber, forKey: "contactNumber")
            user.setValue(newUser.carPlateNumber, forKey: "carPlateNumber")
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert user failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    func getAllUsers() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
    
    func updateUser(user : UserModel){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", user.email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingUser = result[0] as! NSManagedObject
            
            existingUser.setValue(user.name, forKey: "firstname")
            existingUser.setValue(user.carPlateNumber, forKey: "carPlateNumber")
            existingUser.setValue(user.contactNumber, forKey: "contactNumber")
            existingUser.setValue(user.currentMonth, forKey: "currentMonth")
            existingUser.setValue(user.email, forKey: "email")
            existingUser.setValue(user.numOfParkingsMade, forKey: "numOfParkingsMade")
            existingUser.setValue(user.password, forKey: "password")
            
            do{
                try managedContext.save()
                print("User update Successful")
            }catch{
                print("User update unsuccessful")
            }
        }catch{
            print("User update unsuccessful")
        }
    }
    
    func verifySameCarPlateNum(name: String, carPlateNumber: String) -> Bool{//returns true if given carplate number is the same as the carplatenumber of the user
        let allUsers = (self.getAllUsers() ?? nil)!
        
        if (allUsers != nil){
            for user in allUsers{
                let dbName = user.value(forKey: "name") as! String
                let dbCarPlateNumber = user.value(forKey: "carPlateNumber") as! String
                if (dbName == name){
                    if(dbCarPlateNumber == carPlateNumber){
                        return true//if corresponding carplate# is same, return true
                    }
                    return false
                }
            }
        }
        return false
    }
}


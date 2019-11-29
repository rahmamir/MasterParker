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
        let userEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        //if we have access to user table
        if (userEntity != nil){
            let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
            user.setValue(newUser.name, forKey: "name")
            user.setValue(newUser.email, forKey: "email")
            user.setValue(newUser.password, forKey: "password")
            user.setValue(newUser.contactNumber, forKey: "contactNumber")
            user.setValue(newUser.carPlateNumber, forKey: "carPlateNumber")
            user.setValue(newUser.paymentModel.cardName, forKey: "cardName")
            user.setValue(newUser.paymentModel.cardNumber, forKey: "cardNumber")
            user.setValue(newUser.paymentModel.cvvNumber, forKey: "cvvNumber")
            user.setValue(newUser.paymentModel.expiryDate, forKey: "expiryDate")
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert user failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    func returnCarPlateFromEmail(email: String) -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return ""
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingUser = result[0] as! NSManagedObject
            
            let dbEmail = existingUser.value(forKey: "email") as! String
            
            if(dbEmail == email){
                return existingUser.value(forKey: "carPlateNumber") as! String
            }
            
            }catch{
                print("User checking unsuccessful")
            
            }
        return ""
    }
    
    func isValidLogin(email: String, password: String) -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            if(result.count > 0){//found some results
                let existingUser = result[0] as! NSManagedObject
                
                let dbEmail = existingUser.value(forKey: "email") as! String
                let dbPassword = existingUser.value(forKey: "password") as! String
                
                if(dbEmail == email && dbPassword == password){
                    return true
                }
            }
        }catch{
            print("User checking unsuccessful")
        
        }
        return false
    }
    
    func getAllUsers() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
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
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", user.email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingUser = result[0] as! NSManagedObject
            
            existingUser.setValue(user.name, forKey: "name")
            existingUser.setValue(user.carPlateNumber, forKey: "carPlateNumber")
            existingUser.setValue(user.contactNumber, forKey: "contactNumber")
            existingUser.setValue(user.email, forKey: "email")
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
    
    func verifySameCarPlateNum(email: String, carPlateNumber: String) -> Bool{//returns true if given carplate number is the same as the carplatenumber of the user
        let allUsers = (self.getAllUsers() ?? nil)!
        
        if (allUsers != nil){
            for user in allUsers{
                let dbEmail = user.value(forKey: "email") as! String
                let dbCarPlateNumber = user.value(forKey: "carPlateNumber") as! String
                //print(user)
                //print(dbName)
                if (dbEmail == email){
                    if(dbCarPlateNumber == carPlateNumber){
                        print("carplate==givenplate, TRUE")
                        return true//if corresponding carplate# is same, return true
                    }
                    print(dbCarPlateNumber)
                    print(carPlateNumber)
                    print("carplate!=givenplate, FALSE")
                    return false
                }
            }
        }
        print("carplate!=givenplate, FALSE")
        return false
    }
}


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
    func insertUser(newUser: User2)
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
}


//
//  ParkingModel.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation

class ParkingModel {
    
    var buildingCode : Int
    var numOfHours : Int
    var carPlateNum : String
    var suiteNumOfHost : Int
    var dateOfParking : Date
    var parkingCharge : Int
    
    init(BuildingCode: Int, NumOfHours: Int, CarPlateNum: String, SuiteNumOfHost: Int, DateOfParking: Date, parkingCharge : Int) {
        self.buildingCode = BuildingCode
        self.numOfHours = NumOfHours
        self.carPlateNum = CarPlateNum
        self.suiteNumOfHost = SuiteNumOfHost
        self.dateOfParking = DateOfParking
        self.parkingCharge = parkingCharge
    }
}

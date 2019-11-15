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
    
    init(buildingCode: Int, numOfHours: Int, carPlateNum: String, suiteNumOfHost: Int) {
        self.buildingCode = buildingCode
        self.numOfHours = numOfHours
        self.carPlateNum = carPlateNum
        self.suiteNumOfHost = suiteNumOfHost
    }
    
}

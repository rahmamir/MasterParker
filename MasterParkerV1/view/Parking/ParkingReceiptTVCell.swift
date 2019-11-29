//
//  ParkingReceiptTVCell.swift
//  MasterParkerV1
//
//  Created by Mirza Rahman on 2019-11-15.
//  Copyright © 2019 MR. All rights reserved.
//

import UIKit

class ParkingReceiptTVCell: UITableViewCell{
    
    @IBOutlet var carPlateNumber: UILabel!
    @IBOutlet var dateOfParking: UILabel!
    //$parking charge for x hours

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

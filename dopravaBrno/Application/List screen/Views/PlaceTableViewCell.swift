//
//  PlaceTableViewCell.swift
//  dopravaBrno
//
//  Created by Michal Mrnustik on 16/04/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import RealmSwift

class PlaceTableViewCell: UITableViewCell, ReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var item: ListItemModel? {
        didSet {
            guard let item = item else { return }
            name.text = item.originalAnnotation.title ?? ""
            picture.image = item.originalAnnotation.image?.withRenderingMode(.alwaysTemplate)
            picture.tintColor = item.originalAnnotation.color
            if let distance = item.distance {
                distanceLabel.text = "\(distance) m "
            } else {
                distanceLabel.text = ""
            }
            
            if item.originalAnnotation is VendingMachine {
                name.text = "Ticket Machine"
            }
            
            if let vehicle = item.originalAnnotation as? Vehicle {
                name.text?.append(contentsOf: " \(vehicle.finalStop.name ?? "")")
                distanceLabel.text?.append(contentsOf: "| Delay: \(vehicle.delay) min")
            }
        }
    }
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
}

//
//  FoodCell.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 3/29/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

protocol FoodCellDelegate: class {
    func didselectRestaurant(cell:FoodCell)
}

class FoodCell: UITableViewCell {
    
    weak var delegate: FoodCellDelegate?
    
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""), coordinates: BusinessCoordinate(longitude: 0.0, latitude: 0.0), distance: 0.0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBAction func selectRestaurant(_ sender: Any) {
        delegate?.didselectRestaurant(cell: self)
    }
    
    func selectCell(){
        self.contentView.backgroundColor = UIColor.lightGray;
    }
    
    func deselectCell(){
        self.contentView.backgroundColor = UIColor.white;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

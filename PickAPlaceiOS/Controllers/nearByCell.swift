//
//  nearByCell.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 4/18/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class nearByCell: UITableViewCell {
    
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""), coordinates: BusinessCoordinate(longitude: 0.0, latitude: 0.0), distance: 0.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nearByImage: UIImageView!
    @IBOutlet weak var nearByNameLabel: UILabel!
    @IBOutlet weak var nearByRating: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

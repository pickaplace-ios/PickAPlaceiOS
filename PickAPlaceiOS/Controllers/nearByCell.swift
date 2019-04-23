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
    
    @IBOutlet weak var tintView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let rectShape = CAShapeLayer()
        
        rectShape.bounds = self.nearByImage.frame
        rectShape.position = self.nearByImage.center
        rectShape.path = UIBezierPath(roundedRect: self.nearByImage.bounds,     byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 17, height: 17)).cgPath
        
        self.selectionStyle = .none

        
        
        self.nearByImage.layer.mask = rectShape
        
        let path = UIBezierPath(roundedRect: self.tintView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 17, height: 17))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.tintView.bounds
        maskLayer.path = path.cgPath
        self.tintView.layer.mask = maskLayer
    }

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nearByImage: UIImageView!
    @IBOutlet weak var nearByNameLabel: UILabel!
    @IBOutlet weak var nearByRating: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

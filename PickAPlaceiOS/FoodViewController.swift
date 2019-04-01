//
//  FoodViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 3/27/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restaurantNameLabel.text = business.name
        priceLabel.text = business.price
        let imageURL = URL(string: business.image_url)
        restaurantImageView.af_setImage(withURL: imageURL!)
        
    }
    
    @IBOutlet weak var restaurantImageView: UIImageView!    //image for restaurant
    @IBOutlet weak var restaurantNameLabel: UILabel!        //label for restaurant name
    @IBOutlet weak var priceLabel: UILabel! //label for price
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

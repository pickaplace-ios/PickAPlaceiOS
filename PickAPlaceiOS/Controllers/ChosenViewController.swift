//
//  ChosenViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/8/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class ChosenViewController: UIViewController {
    
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

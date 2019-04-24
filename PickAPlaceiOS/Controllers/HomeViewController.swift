//
//  HomeViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 3/30/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.navigationItem.hidesBackButton = true
        print(UserLocation.getLongitude())

        // Do any additional setup after loading the view.
    }

    @IBAction func chooseFood(_ sender: Any) {
        
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

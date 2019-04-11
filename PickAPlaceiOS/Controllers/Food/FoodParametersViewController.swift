//
//  ParametersViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/10/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class FoodParametersViewController: UIViewController {

    @IBOutlet weak var priceSegControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func grabPrice() {
        var param = ""
        if (priceSegControl.selectedSegmentIndex == 0){
            param = "price=1"
        }
        else if (priceSegControl.selectedSegmentIndex == 1){
            param = "price=1,2"
        }
        else if (priceSegControl.selectedSegmentIndex == 2){
            param = "price=1,2,3"
        }
        else {
            param = "price=1,2,3,4"
        }
    }
    

    @IBAction func submitParameters(_ sender: Any) {
        
        
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

//
//  HotelsParameterViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/22/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class HotelsParameterViewController: UIViewController {

    var params = [String]()
    
    
    @IBOutlet weak var priceSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        params.append("categories=hotels&")
        
        // Do any additional setup after loading the view.
    }
    
    func grabPrice() {
        if (priceSegControl.selectedSegmentIndex == 0){
            params.append("price=1")
        }
        else if (priceSegControl.selectedSegmentIndex == 1){
            params.append("price=1,2")
        }
        else if (priceSegControl.selectedSegmentIndex == 2){
            params.append("price=1,2,3")
        }
        else {
            params.append("price=1,2,3,4")
        }
    }
    
    

    @IBAction func submit(_ sender: Any) {
        grabPrice()
        self.performSegue(withIdentifier: "toRadius", sender: params)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let params = sender as? [String] else {return}
        guard let vc = segue.destination as? UserRadiusViewController else {return}
        vc.params = self.params
    }

}

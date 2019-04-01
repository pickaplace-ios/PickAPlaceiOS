//
//  UserRadiusViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/1/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class UserRadiusViewController: UIViewController {
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitRadius(_ sender: Any) {
        let input = radiusTextField.text as String?
        var radius = Int(input ?? "0")
        
        if radius == 0 {
            // throw an error popup
        }
        else {
            self.performSegue(withIdentifier: "toTable", sender: radius)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let radius = sender as? Int else {return}
        guard let vc = segue.destination as? categoriesTableViewController else {return}
        vc.radius = radius
    }
    

}

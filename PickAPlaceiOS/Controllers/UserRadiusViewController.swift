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
    
    let alertController = UIAlertController(title: "Error", message: "Invalid Radius. Please input a new distance", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
    }
    

    @IBAction func submitRadius(_ sender: Any) {
        let input = radiusTextField.text as String?
        let radius = Int(input ?? "0")
        
        if radius == 0 || radius == nil {
            present(alertController, animated: true) {
                self.radiusTextField.text = "";
            }
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

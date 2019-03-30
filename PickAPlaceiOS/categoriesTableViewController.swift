//
//  categoriesTableViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 3/29/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class categoriesTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let navBarHeight = UIApplication.shared.statusBarFrame.size.height  //gets navigation bars height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.rowHeight = (screenHeight - navBarHeight) / 5    //allows for rows to be evenly spread-out throughout the screen even with the nav bar
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        
        cell.restaurantNameLabel.text = "Testing"
        let dog = UIImage(named: "IMG_0074")
        cell.restaurantImage.image = dog
        return cell
    }
    
    public var screenWidth: CGFloat {   //gets width of screen
        return UIScreen.main.bounds.width
    }
    
    public var screenHeight: CGFloat {  //gets height of screen
        return UIScreen.main.bounds.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

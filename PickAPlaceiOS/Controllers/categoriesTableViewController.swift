//
//  categoriesTableViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 3/29/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class categoriesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FoodCellDelegate
 {
    let alertController = UIAlertController(title: "Error", message: "Invalid selection. Please select 3 locations", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
    }
    
    var businesses = [Business]();
    var radius = 0;
    var chosen = [FoodCell]();
    var params = [String]();
    
    func didselectRestaurant(cell:FoodCell) {
        if (chosen.contains(cell) == true){
            let index = chosen.index(of:cell)
            chosen.remove(at: index!)
            cell.deselectCell()
        }
        else {
            if (chosen.count < 3){
                cell.selectCell()
                chosen.append(cell)
            }
            else {
                
                present(alertController, animated: true);
                cell.deselectCell()
            }
        }
    }


    @IBOutlet weak var tableView: UITableView!
    let navBarHeight = UIApplication.shared.statusBarFrame.size.height  //gets navigation bars height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = tableView.frame.height / 5
        self.retrieveBusinesses()
        self.tableView.separatorStyle = .none
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func retrieveBusinesses(){
        
        let baseURL = "https://api.yelp.com/v3/businesses/search?"
        let latitude = UserLocation.getLatitude()
        let longitude = UserLocation.getLongitude()
       
        radius = radius * 1609
        
        if radius > 40000 {
            radius = 40000
        }
        
        var url = "\(baseURL)latitude=\(latitude)&longitude=\(longitude)&radius=\(self.radius)"
        
        for i in 0..<params.count {
            url = url + "&\(params[i])"
        }
        
        print(url)
        
        Alamofire.request(url, headers: ["Authorization": "IgLkvlfGTAh97o95QL1aCjSc9p2xPVD4IHe8mpE8aLdrp2LHnV1_x0IVcGuFWF2Jl46zK8tpMNYfYRIs0psT-grsZn0n791Cr7es3ghjzGOQdJp5jOLlrbs8hHW_XHYx"]).responseJSON { (response) in
            if let error = response.error{
                print(error.localizedDescription)
                return
            }
            
            guard let data = response.data else {
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let wrapper = try jsonDecoder.decode(BusinessWrapper.self, from: data)
                self.businesses = wrapper.businesses
                
                var repeats: [Int: Bool] = [:]
                while repeats.count != 5 {  //gets 5 indexes for 5 random restaurants
                    let random = Int.random(in: 0 ..< self.businesses.count)
                    if repeats[random] == nil {
                        repeats[random] = true
                    }
                }
                let keys = Array(repeats.keys)  //gets the keys from the dictionary
                var temp = [Business]()         //hold the Business from the 5 keys
                for i in 0 ..< 5 {
                    temp.append(self.businesses[keys[i]])
                }
                self.businesses = temp
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return businesses.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        let business = businesses[indexPath.row]
        
        cell.delegate = self
        
        cell.business = business
        cell.restaurantNameLabel.text = business.name
        cell.selectionStyle = .none

        /*
        let imageURL = URL(string: business.image_url)
        if imageURL != nil {
            cell.restaurantImage.af_setImage(withURL: imageURL!)
        }
         */
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
    
    func chooseDestination() -> Business{
        let number = Int.random(in: 0 ... 2)
        return chosen[number].business
    }
    
    @IBAction func submitChoices(_ sender: Any) {
        if (chosen.count < 3){
            // popup error goes here
        }
        else {
            self.performSegue(withIdentifier: "submitSegue", sender: radius)
        }
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "submitSegue"){
            let cellBusiness = chooseDestination()
            let chosenViewController = segue.destination as! ChosenViewController
            chosenViewController.business = cellBusiness
        }
        else {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            
            // Identify selected movie cell
            let cell = sender as! UITableViewCell
            
            // Gets the index of that cell because the tableview knows the index for a cell
            let indexPath = tableView.indexPath(for: cell)!
            
            let business = businesses[indexPath.row]
            
            // Identify the destination
            // Must cast because the destination is a generic VC
            let foodDetailViewController = segue.destination as! FoodViewController
            
            // Bundle the movie information to the next screen
            
            foodDetailViewController.business = business;
            
            // Deselect while traveling to the next screen
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
    }

}

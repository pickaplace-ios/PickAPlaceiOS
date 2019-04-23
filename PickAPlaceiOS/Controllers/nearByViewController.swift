//
//  nearyByViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 4/18/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class nearByViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var businesses = [Business]();
    var radius = 0;
    var chosen = [nearByCell]();
    var params = [String]();
    let navBarHeight = UIApplication.shared.statusBarFrame.size.height  //gets navigation bars height

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.retrieveBusinesses()
        self.tableView.rowHeight = tableView.frame.height / 5
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nearByCell") as! nearByCell
        let business = businesses[indexPath.row]
        cell.business = business
        cell.nearByNameLabel.text = business.name
        let imageURL = URL(string: business.image_url)
        if imageURL != nil {
            cell.nearByImage.af_setImage(withURL: imageURL!)
        }
        cell.nearByRating.text = "\(String(business.rating))/5"
        cell.distanceLabel.text = "\(String(format: "%.2f", business.distance/1609)) mi"
        cell.priceLabel.text = business.price
        return cell
    }
    
    func retrieveBusinesses(){
        let baseURL = "https://api.yelp.com/v3/businesses/search?"
        let latitude = UserLocation.getLatitude()
        let longitude = UserLocation.getLongitude()
        var url = "\(baseURL)latitude=\(latitude)&longitude=\(longitude)"
        
        
        Alamofire.request(url, headers: ["Authorization": "API-KEY"]).responseJSON { (response) in
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
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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

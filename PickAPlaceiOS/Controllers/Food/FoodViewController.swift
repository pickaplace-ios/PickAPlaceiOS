//
//  FoodViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 3/27/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import MapKit

class FoodViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var tintView: UIView!
    let regionRadius: CLLocationDistance = 1000

    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""), coordinates: BusinessCoordinate(longitude: 0.0, latitude: 0.0), distance: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restaurantNameLabel.text = business.name
        priceLabel.text = business.price
        ratingLabel.text = "\(String(business.rating))/5"
        let initialLocation = CLLocation(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
        centerMapOnLocation(location: initialLocation)
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2D(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
        annotation.coordinate = locationCoordinate
        annotation.title = business.name
        mapView.addAnnotation(annotation)
        let imageURL = URL(string: business.image_url)
        if imageURL != nil {
            restaurantImageView.af_setImage(withURL: imageURL!)
        }
        let rectShape = CAShapeLayer()
        
        rectShape.bounds = self.restaurantImageView.frame
        rectShape.position = self.restaurantImageView.center
        rectShape.path = UIBezierPath(roundedRect: self.restaurantImageView.bounds,     byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 17, height: 17)).cgPath
        
        
        self.restaurantImageView.layer.mask = rectShape
        
        let path = UIBezierPath(roundedRect: self.tintView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 17, height: 17))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.tintView.bounds
        maskLayer.path = path.cgPath
        self.tintView.layer.mask = maskLayer
        
        let dist = String(format: "%.2f", business.distance/1609)
        
        distanceLabel.text = "\(dist) mi"
        
        
        locationLabel.text = "\(business.location.address1), \(business.location.city), \(business.location.state)"
        
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!    //image for restaurant
    @IBOutlet weak var restaurantNameLabel: UILabel!        //label for restaurant name
    @IBOutlet weak var priceLabel: UILabel! //label for price
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBAction func openYelp(_ sender: Any) {
        if let url = URL(string: business.url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
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

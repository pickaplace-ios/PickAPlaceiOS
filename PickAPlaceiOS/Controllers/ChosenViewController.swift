//
//  ChosenViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/8/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import MapKit


class ChosenViewController: UIViewController {
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""), coordinates: BusinessCoordinate(longitude: 0.0, latitude: 0.0), distance: 0.0)
    let regionRadius: CLLocationDistance = 1000
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        ratingLabel.text = "\(String(business.rating))/5"
        nameLabel.text = business.name
        let initialLocation = CLLocation(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
        centerMapOnLocation(location: initialLocation)
        priceLabel.text = business.price
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
        
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2D(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
        annotation.coordinate = locationCoordinate
        annotation.title = business.name
        mapView.addAnnotation(annotation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    @IBAction func textFriends(_ sender: Any) {
        let name = business.name
        let sms: String = "sms:&body=Hey! Let's go to \(name)!"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }

    @IBAction func openInMaps(_ sender: Any) {
        let latitude:CLLocationDegrees =  business.coordinates.latitude
        let longitude:CLLocationDegrees =  business.coordinates.longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(business.name)"
        mapItem.openInMaps(launchOptions: options)
    }

    @IBAction func callBusiness(_ sender: Any) {
        let start = business.phone.index(business.phone.startIndex, offsetBy: 1)
        let call: String = "tel://\(business.phone[start..<business.phone.endIndex])"
        print(call)
        UIApplication.shared.open(URL.init(string: call)!, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBAction func viewYelp(_ sender: Any) {
        if let url = URL(string: business.url) {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    @IBAction func goHome(_ sender: Any) {
        self.performSegue(withIdentifier: "goHome", sender: nil)
    }
}

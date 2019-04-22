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
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    var business = Business(name: "", rating: 0.0, image_url: "", phone: "", price: "", url: "", location: Location(city: "", country: "", address1: "", address2: "", address3: "", state: "", zip_code: ""), coordinates: BusinessCoordinate(longitude: 0.0, latitude: 0.0), distance: 0.0)
    let regionRadius: CLLocationDistance = 1000
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = business.name
        let initialLocation = CLLocation(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
        centerMapOnLocation(location: initialLocation)
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

}

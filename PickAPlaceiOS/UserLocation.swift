//
//  Location.swift
//  PickAPlaceiOS
//
//  Created by Alex Rich on 3/27/19.
//  Copyright © 2019 keithatan. All rights reserved.
//
class UserLocation {
    private static var latitude: Double = 0.0
    private static var longitude: Double = 0.0
    
    public static func getLatitude()->Double {
        return latitude;
    }
    
    public static func getLongitude()->Double {
        return longitude;
    }
    
    public static func setLatitude(newLatitude: Double) {
        latitude = newLatitude
        print("set latitude as \(latitude)")
    }
    
    public static func setLongitude(newLongitude: Double) {
        longitude = newLongitude
        print("set longitude as \(longitude)")
    }
}

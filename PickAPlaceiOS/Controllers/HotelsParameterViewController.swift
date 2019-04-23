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
    
    
    @IBOutlet weak var resortBtn: UIButton!
    @IBOutlet weak var guesthouseBtn: UIButton!
    @IBOutlet weak var campBtn: UIButton!
    @IBOutlet weak var hostelsBtn: UIButton!
    @IBOutlet weak var bnbBtn: UIButton!
    @IBOutlet weak var priceSegControl: UISegmentedControl!
    
    @IBOutlet weak var retreatsBtn: UIButton!
    
    var types:[String:Bool] = ["resorts":false, "guesthouses":false, "healthretreats":false,  "campgrounds":false, "bedbreakfast":false, "hostels":false]
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func chooseHostels(_ sender: Any) {
        if types["hostels"] == false{
            types["hostels"] = true
            hostelsBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["hostels"] = false
            hostelsBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseCamp(_ sender: Any) {
        if types["campgrounds"] == false{
            types["campgrounds"] = true
            campBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["campgrounds"] = false
            campBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseRetreat(_ sender: Any) {
        if types["healthretreats"] == false{
            types["healthretreats"] = true
            retreatsBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["healthretreats"] = false
            retreatsBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseResort(_ sender: Any) {
        if types["resorts"] == false{
            types["resorts"] = true
            resortBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["resorts"] = false
            resortBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseGuest(_ sender: Any) {
        if types["guesthouses"] == false{
            types["guesthouses"] = true
            guesthouseBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["guesthouses"] = false
            guesthouseBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseBnb(_ sender: Any) {
        if types["bedbreakfast"] == false{
            types["bedbreakfast"] = true
            bnbBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["bedbreakfast"] = false
            bnbBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    

    @IBAction func submit(_ sender: Any) {
        grabPrice()
        grabTypes()
        self.performSegue(withIdentifier: "toRadius", sender: params)
        
    }
    
    func grabTypes(){
        var category = "categories="
        var keys = Array(types.keys)
        
        for i in 0..<keys.count{
            if (types[keys[i]] == true){
                category.append(keys[i])
                category.append(",")
            }
        }
        
        if (category == "categories="){
            category.append("hotels")
        }
        else {
            category = String(category.dropLast())
        }
        
        params.append(category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let params = sender as? [String] else {return}
        guard let vc = segue.destination as? UserRadiusViewController else {return}
        vc.params = self.params
    }

}

//
//  StoreParameterViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/22/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class StoreParameterViewController: UIViewController {

    var params = [String]()
    var types:[String:Bool] = ["videogamestores":false, "bookstores":false, "deptstores":false, "drugstores":false, "shoes":false, "outlet_stores":false, "thrift_stores":false, "petstore":false, "fashion":false]
    
    @IBOutlet weak var thriftBtn: UIButton!
    @IBOutlet weak var fashionBtn: UIButton!
    
    @IBOutlet weak var petBtn: UIButton!
    @IBOutlet weak var outletBtn: UIButton!
    @IBOutlet weak var shoeBtn: UIButton!
    @IBOutlet weak var drugBtn: UIButton!
    @IBOutlet weak var deptBtn: UIButton!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var videogameBtn: UIButton!
    @IBOutlet weak var priceSegControl: UISegmentedControl!
    
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
    @IBAction func chooseFashion(_ sender: Any) {
        if types["fashion"] == false{
            types["fashion"] = true
            fashionBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["fashion"] = false
            fashionBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func choosePet(_ sender: Any) {
        if types["petstore"] == false{
            types["petstore"] = true
            petBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["petstore"] = false
            petBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseThrift(_ sender: Any) {
        if types["thrift_stores"] == false{
            types["thrift_stores"] = true
            thriftBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["thrift_stores"] = false
            thriftBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseOutlet(_ sender: Any) {
        if types["outlet_stores"] == false{
            types["outlet_stores"] = true
            outletBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["outlet_stores"] = false
            outletBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseShoe(_ sender: Any) {
        if types["shoes"] == false{
            types["shoes"] = true
            shoeBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["shoes"] = false
            shoeBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseDrug(_ sender: Any) {
        if types["drugstores"] == false{
            types["drugstores"] = true
            drugBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["drugstores"] = false
            drugBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseDept(_ sender: Any) {
        if types["deptstores"] == false{
            types["deptstores"] = true
            deptBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["deptstores"] = false
            deptBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseBooks(_ sender: Any) {
        if types["bookstores"] == false{
            types["bookstores"] = true
            bookBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["bookstores"] = false
            bookBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseVideogames(_ sender: Any) {
        if types["videogamestores"] == false{
            types["videogamestores"] = true
            videogameBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["videogamestores"] = false
            videogameBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
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
            category.append("stores")
        }
        else {
            category = String(category.dropLast())
        }
        
        params.append(category)
    }
    
    
    @IBAction func submit(_ sender: Any) {
        grabPrice()
        grabTypes()
        self.performSegue(withIdentifier: "toRadius", sender: params)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let params = sender as? [String] else {return}
        guard let vc = segue.destination as? UserRadiusViewController else {return}
        vc.params = self.params
    }

    @IBAction func backButton(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil) 
    }
}

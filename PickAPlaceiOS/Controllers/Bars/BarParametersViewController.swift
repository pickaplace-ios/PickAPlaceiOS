//
//  BarParametersViewController.swift
//  PickAPlaceiOS
//
//  Created by Adam Ding on 4/14/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class BarParametersViewController: UIViewController {
    
    var params = [String]()
    var types:[String:Bool] = ["juicebars":false, "milkshakebars":false, "beachbars":false, "divebars":false, "cigarbars":false, "cocktailbars":false, "wine_bars":false, "sportsbars":false, "pubs":false]

    @IBOutlet weak var juiceBtn: UIButton!
    
    @IBOutlet weak var milkshakeBtn: UIButton!
    @IBOutlet weak var priceSegControl: UISegmentedControl!
    @IBOutlet weak var beachBtn: UIButton!
    
    @IBOutlet weak var diveBtn: UIButton!
    @IBOutlet weak var cigarBtn: UIButton!
    @IBOutlet weak var cocktailBtn: UIButton!
    @IBOutlet weak var wineBtn: UIButton!
    @IBOutlet weak var sportBtn: UIButton!
    @IBOutlet weak var pubBtn: UIButton!
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
    
    @IBAction func chooseJuice(_ sender: Any) {
        if types["juicebars"] == false{
            types["juicebars"] = true
            juiceBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["juicebars"] = false
            juiceBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseMilkshake(_ sender: Any) {
        if types["milkshakebars"] == false{
            types["milkshakebars"] = true
            milkshakeBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["milkshakebars"] = false
            milkshakeBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseBeach(_ sender: Any) {
        if types["beachbars"] == false{
            types["beachbars"] = true
            beachBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["beachbars"] = false
            beachBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseDive(_ sender: Any) {
        if types["divebars"] == false{
            types["divebars"] = true
            diveBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["divebars"] = false
            diveBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseCigar(_ sender: Any) {
        if types["cigarbars"] == false{
            types["cigarbars"] = true
            cigarBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["cigarbars"] = false
            cigarBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseCocktail(_ sender: Any) {
        if types["cocktailbars"] == false{
            types["cocktailbars"] = true
            cocktailBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["cocktailbars"] = false
            cocktailBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseWine(_ sender: Any) {
        if types["wine_bars"] == false{
            types["wine_bars"] = true
            wineBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["wine_bars"] = false
            wineBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func chooseSports(_ sender: Any) {
        if types["sportsbars"] == false{
            types["sportsbars"] = true
            sportBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["sportsbars"] = false
            sportBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func choosePubs(_ sender: Any) {
        if types["pubs"] == false{
            types["pubs"] = true
            pubBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["pubs"] = false
            pubBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
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
            category.append("bars")
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

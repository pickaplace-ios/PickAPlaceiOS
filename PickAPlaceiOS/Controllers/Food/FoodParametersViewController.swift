//
//  ParametersViewController.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 4/10/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class FoodParametersViewController: UIViewController {
    @IBOutlet weak var asianBtn: UIButton!
    @IBOutlet weak var indianBtn: UIButton!
    @IBOutlet weak var bbqBtn: UIButton!
    
    @IBOutlet weak var hispanicBtn: UIButton!
    @IBOutlet weak var pizzaBtn: UIButton!
    @IBOutlet weak var mexicanBtn: UIButton!
    @IBOutlet weak var seafoodBtn: UIButton!
    @IBOutlet weak var italianBtn: UIButton!
    @IBOutlet weak var americanBtn: UIButton!
    var params = [String]()
    var types:[String:Bool] = ["american":false, "asian":false, "italian":false, "seafood":false, "indian":false, "mexican":false, "pizza":false, "bbq":false, "hispanic":false]

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
    @IBAction func chooseItalian(_ sender: Any) {
        if types["italian"] == false{
            types["italian"] = true
            italianBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["italian"] = false
            italianBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)

        }
    }
    @IBAction func chooseSeafood(_ sender: Any) {
        if types["seafood"] == false{
            types["seafood"] = true
            seafoodBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["seafood"] = false
            seafoodBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseIndian(_ sender: Any) {
        if types["indian"] == false{
            types["indian"] = true
            indianBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["indian"] = false
            indianBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseMexican(_ sender: Any) {
        if types["mexican"] == false{
            types["mexican"] = true
            mexicanBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["mexican"] = false
            mexicanBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseBBQ(_ sender: Any) {
        if types["bbq"] == false{
            types["bbq"] = true
            bbqBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["bbq"] = false
            bbqBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseHispanic(_ sender: Any) {
        if types["hispanic"] == false{
            types["hispanic"] = true
            hispanicBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["hispanic"] = false
            hispanicBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    
    @IBAction func choosePizza(_ sender: Any) {
        if types["pizza"] == false{
            types["pizza"] = true
            pizzaBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["pizza"] = false
            pizzaBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseAsian(_ sender: Any) {
        if types["asianfusion"] == false{
            types["asianfusion"] = true
            asianBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["asianfusion"] = false
            asianBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
        }
    }
    @IBAction func chooseAmerican(_ sender: Any) {
        if types["american"] == false{
            types["american"] = true
            americanBtn.setBackgroundImage(UIImage(named: "selectedParameter"), for: .normal)
        }
        else {
            types["american"] = false
            americanBtn.setBackgroundImage(UIImage(named: "unselectedParameter"), for: .normal)
            
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
            category.append("restaurants")
        }
        else {
            category = String(category.dropLast())
        }
        
        params.append(category)
    }
    

    @IBAction func submitParameters(_ sender: Any) {
        grabPrice()
        grabTypes()
        
        self.performSegue(withIdentifier: "toRadius", sender: params)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let params = sender as? [String] else {return}
        guard let vc = segue.destination as? UserRadiusViewController else {return}
        vc.params = self.params
    }
    

}

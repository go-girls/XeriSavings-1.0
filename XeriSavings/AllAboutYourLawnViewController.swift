//
//  AllAboutYourLawnViewController.swift
//  XeriSavings
//
//  Created by samv on 3/29/18.
//  Copyright © 2018 cluboreo. All rights reserved.
// Testing

import UIKit
import Firebase
import DLRadioButton


class AllAboutYourLawnViewController: UIViewController {
    
    var selectedYardSize : Bool = false
    var selectedGrassType : Bool = false
    var aboutYourLawnDB : FIRDatabaseReference?
    
    @IBOutlet weak var grassType: DLRadioButton!
    @IBOutlet weak var summerWaterBillTextField: UITextField!
    @IBOutlet weak var WinterWaterBillTextField: UITextField!
    @IBOutlet weak var typeOfGrassErrorLabel: UILabel!
    @IBOutlet weak var yardSizeErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creating reference for aboutYourLawn Database
        aboutYourLawnDB = FIRDatabase.database().reference().child("aboutYourLawn")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveWaterUsageAction(_ sender: UIButton) {
        
        let username : String = (FIRAuth.auth()?.currentUser?.email)!
        let uid : String = (FIRAuth.auth()?.currentUser?.uid)!
        
        let aboutYourLawn = ["email":username as String?,
                             "summer_water_consumption": summerWaterBillTextField.text,
                             "winter_water_consumption": WinterWaterBillTextField.text]
        
        aboutYourLawnDB?.child(uid).setValue(aboutYourLawn)
        performSegue(withIdentifier: "goToAllAboutYourLawn", sender: UIButton())
        
    }
    
    @IBAction func saveGrassType(_ sender: DLRadioButton) {
        var typeOfGrass: String
        let uid : String = (FIRAuth.auth()?.currentUser?.uid)!
        if sender.tag == 1 {
            typeOfGrass = "St Augustine"
        }else if sender.tag == 2 {
            typeOfGrass = "Bermuda"
        }else if sender.tag == 3 {
            typeOfGrass = "Buffalo"
        }else if sender.tag == 4 {
            typeOfGrass = "Zoysia"
        }else {
            typeOfGrass = "Habiturf"
        }
       
        aboutYourLawnDB?.child("\(uid)/typeOfGrass").setValue(typeOfGrass)
        selectedGrassType = true
       
    }
    
    
    @IBAction func saveSizeOfYard(_ sender: DLRadioButton) {
        var yardSize: Int
        let uid : String = (FIRAuth.auth()?.currentUser?.uid)!
        if sender.tag == 1 {
            yardSize = 1000
        }else if sender.tag == 2 {
            yardSize = 5000
        }else if sender.tag == 3 {
            yardSize = 10000
        }else {
            yardSize = 15000
        }
        
        aboutYourLawnDB?.child("\(uid)/yardSize").setValue(yardSize)
        selectedYardSize = true
        
    }
    
    
    @IBAction func goToRecommendationsAction(_ sender: UIBarButtonItem) {
        if selectedYardSize {
            performSegue(withIdentifier: "goToRecommendations", sender: self)
        } else {
            yardSizeErrorLabel.text = "Please select an option"
        }
    }
    
    @IBAction func goToSelectYardSizeAction(_ sender: UIBarButtonItem) {
        if selectedGrassType {
            performSegue(withIdentifier: "goToLawnSizeSelectionView", sender: self)
        } else{
            typeOfGrassErrorLabel.text = "Please select an option"
        }
    }
    
}

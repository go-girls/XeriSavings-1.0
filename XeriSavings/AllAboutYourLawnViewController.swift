//
//  AllAboutYourLawnViewController.swift
//  XeriSavings
//
//  Created by samv on 3/29/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase
import DLRadioButton


class AllAboutYourLawnViewController: UIViewController {
    
    @IBOutlet weak var grassType: DLRadioButton!
    
    @IBOutlet weak var summerWaterBillTextField: UITextField!
    
    @IBOutlet weak var WinterWaterBillTextField: UITextField!
    var aboutYourLawnDB : FIRDatabaseReference?
    
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
        
        let aboutYourLawn = ["email":username as String!,
                             "WaterUsage": String(calculateWaterUsage())]
        
        aboutYourLawnDB?.child(uid).setValue(aboutYourLawn)
        performSegue(withIdentifier: "goToAllAboutYourLawn", sender: UIButton())
        
    }
    
    //
    func calculateWaterUsage() -> Float {
        let summerUsage = (summerWaterBillTextField.text as NSString!).floatValue
        let winterUsage = (WinterWaterBillTextField.text as NSString!).floatValue
        
        return summerUsage - winterUsage
        
    }
    //Making sure the computer can differ from the grass type by the tags, and saving it to the Firebase.
    
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
       
        aboutYourLawnDB?.child("\(uid)/typeOfGrass").setValue(["name": typeOfGrass])
       
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
        
        aboutYourLawnDB?.child("\(uid)/yardSize").setValue(["size": yardSize])
        
    }
    
    @IBAction func shadyOrSunny(_ sender: DLRadioButton) {
        var shadyOrSunny : String
        let uid : String = (FIRAuth.auth()?.currentUser?.uid)!
        if sender.tag == 1 {
           shadyOrSunny = "Shady"
        }else {
            shadyOrSunny = "Sunny"
    }
    
    
    aboutYourLawnDB?.child("\(uid)/shadyOrSunny").setValue(["name": shadyOrSunny])
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}

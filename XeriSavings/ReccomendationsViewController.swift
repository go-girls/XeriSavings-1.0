//
//  ReccomendationsViewController.swift
//  XeriSavings
//
//  Created by samv on 4/7/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase

class ReccomendationsViewController: UIViewController {
    
    var dbReference : FIRDatabaseReference!
    var yardSize : Int = 0
    var ET : Float = 0.0
    let austinETo : [Float] = [ 2.27, 2.72, 4.34, 5.27, 6.39, 7.15, 7.22, 7.25, 5.57, 4.38, 2.74, 2.21]
    let austinAverageRainFall : [Float] = [2.11, 2.41, 2.05,3.01,4.38,3.46,2.05, 2.23, 3.38,3.35,2.28,2.46]
    
    
    // Labels for displaying Recommendations
    @IBOutlet weak var tenPercentWaterSavings: UILabel!
    @IBOutlet weak var tenPercentMoneySavings: UILabel!
    @IBOutlet weak var twentyFivePercentWaterSavings: UILabel!
    @IBOutlet weak var twnetyFiveMoneySavings: UILabel!
    @IBOutlet weak var fiftyPercentWaterSavings: UILabel!
    @IBOutlet weak var fiftyPercentMoneySavings: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        waterUsageCalc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(dbReference)
        // Dispose of any resources that can be recreated.
    }
    
    /*
      Calculating water usage based on
     */
    func waterUsageCalc() {
        let uid : String = (FIRAuth.auth()?.currentUser?.uid)!
        dbReference = FIRDatabase.database().reference().child("aboutYourLawn")
        dbReference.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            print(value!)
            self.yardSize = (value?["yardSize"] as? Int)!
            print(self.yardSize)
            
            for index in 1...12 {
                let monthlyET : Float = self.austinETo[index - 1] * self.austinAverageRainFall[index - 1] * 0.2244 * Float(self.yardSize)
                print(monthlyET)
                self.ET = self.ET + monthlyET
            }
            print("Total Water usage per year \(self.ET)")
            self.displayOnScreen()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func displayOnScreen(){
        tenPercentWaterSavings.text = "\(ET/10.0) gallons of water"
        tenPercentMoneySavings.text = "$\(Int(ET * 0.000668449))"
        twentyFivePercentWaterSavings.text = "\(ET/4.0)gallons of water"
        twnetyFiveMoneySavings.text = "$\(Int(ET * 0.0016711299))"
        fiftyPercentWaterSavings.text = "\(ET/2.0) gallons of water"
        fiftyPercentMoneySavings.text = "$\(Int(ET * 0.00334224598))"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  WelcomeViewController.swift
//  XeriSavings
//
//  Created by samv on 4/9/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase
class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func guestLoginAction(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: "fllcluboreo@gmail.com", password: "oreogirls!", completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            } else {
                self.performSegue(withIdentifier: "gotoCreateProjectFromGuest", sender: self)
            }
        })    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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

    @IBOutlet weak var loginLogoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let uid : String = (FIRAuth.auth()?.currentUser?.uid) ?? ""
        if uid.count > 0 && uid != "qFfDjfwuvQVkyHqTIiMx2Rlpxfn1" {
            loginLogoutButton.setTitle("Logout", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginLogoutAction(_ sender: Any) {
        if loginLogoutButton.title(for: .normal) == "Login"{
            performSegue(withIdentifier: "goToLogin", sender: self)
        } else {
            do {
                try FIRAuth.auth()?.signOut()
            } catch {
                print("error: there was a problem signing out")
            }
            loginLogoutButton.setTitle("Login", for: .normal)
        }
    }
    
    @IBAction func guestLoginAction(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: "fllcluboreo@gmail.com", password: "oreogirls!", completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            } else {
                self.performSegue(withIdentifier: "gotoCreateProjectFromGuest", sender: self)
            }
        })
        
    }

}

//
//  CreateProjectViewController.swift
//  XeriSavings
//
//  Created by samv on 3/25/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase

class CreateProjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            print("error: there was a problem signing out")
        }
        guard (navigationController?.popToRootViewController(animated: true)) != nil
            else {
                print("No View Controllers to pop off")
                return
            }
    }
   
}

//
//  LoginViewController.swift
//  XeriSavings
//
//  Created by samv on 3/25/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func LoginAction(_ sender: UIButton) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                self.errorLabel.text = error?.localizedDescription
                return
            } else {
                self.performSegue(withIdentifier: "goToCreateYourProject", sender: self)
            }
        })
    }
}

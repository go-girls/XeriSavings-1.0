//
//  RegisterViewController.swift
//  XeriSavings
//
//  Created by samv on 3/25/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUserClicked(_ sender: UIButton) {
        if ((emailTextField?.text?.count)! < 3 && (passwordTextField?.text?.count) == 0) {
            errorLabel.text = "Please, enter valid email and password"
            return
        }
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            } else {
                self.performSegue(withIdentifier: "goToCreateYourProject", sender: self)
            }
        })
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

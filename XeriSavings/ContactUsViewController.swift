//
//  ContactUsViewController.swift
//  XeriSavings
//
//  Created by samv on 4/11/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oreoWebsiteButton(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.cluboreo.com"){
            UIApplication.shared.open(url as URL, options: [ : ], completionHandler: nil)
        }
    }
    
    @IBAction func oreoTwitterButton(_ sender: UIButton) {
        if let url = NSURL(string: "https://twitter.com/fllcluboreo"){
            UIApplication.shared.open(url as URL, options: [ : ], completionHandler: nil)
        }
    }
    
    @IBAction func oreoInstagramButton(_ sender: UIButton) {
        let instagramHooks = "instagram://user?username=fllcluboreo"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have Instagram
            if let url = NSURL(string: "https://www.instagram.com/fllcluboreo"){
                UIApplication.shared.open(url as URL, options: [ : ], completionHandler: nil)
            }
        }
    }

    @IBAction func oreoFacebookButton(_ sender: UIButton) {
        let facebookHooks = "fb://profile/522716461220500"
        let facebookUrl = NSURL(string: facebookHooks)
        if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
            UIApplication.shared.open(facebookUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have Facebook
            
            if let url = NSURL(string: "https://www.facebook.com/ClubOreoFLL/"){
                UIApplication.shared.open(url as URL, options: [ : ], completionHandler: nil)
            }
        }
    }
}

//522716461220500 (Facebook identity)

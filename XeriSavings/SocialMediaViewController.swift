///Users/fll/Documents/XeriSavings-1.5/XeriSavings/SocialMediaViewController.swift
//  SocialMediaViewController.swift
//  XeriSavings
//
//  Created by FLL on 4/11/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit

class SocialMediaViewController:
    
    
UIViewController {
    @IBAction func instaButton(_ sender: Any) {
        let url = NSURL(string: "https://www.instagram.com/fllcluboreo/")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)
        
    }
    
    func openURL(sender: UIButton) {
        let url = NSURL(string: "https://www.instagram.com/fllcluboreo/")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func twitterButton(_ sender: Any) {
        let url = NSURL(string: "https://twitter.com/fllcluboreo")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)
    }
    
    
    @IBAction func facebookButton(_ sender: Any) {
        let url = NSURL(string: "https://www.facebook.com/ClubOreoFLL/")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)
 }
    
    
    @IBAction func website(_ sender: Any) {
        let url = NSURL(string: "https://www.cluboreo.com")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)
    }
    
    
    @IBAction func mail(_ sender: Any) {
        let url = NSURL(string: "mailto:fllcluboreo@gmail.com")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)

        
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

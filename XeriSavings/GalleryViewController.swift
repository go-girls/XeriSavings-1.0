//
//  GalleryViewController.swift
//  XeriSavings
//
//  Created by FLL on 4/11/18.
//  Copyright © 2018 cluboreo. All rights reserved.
//

import UIKit

class GalleryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ecotopeswebsite(_ sender: Any) {
        let url = NSURL(string: "http://ecotopes.com")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler:nil)

    }
    
    
    @IBAction func LaRosewebsite(_ sender: Any) {
        let url = NSURL(string: "http://laroselandscape.com")
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

//
//  ProfileViewController.swift
//  Instagrammy
//
//  Created by Barbara Ristau on 3/5/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var logInStatusLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func logInStatus(sender: UISwitch) {
        
        if sender.selected == true {
            print("user is logged in")
        } else {
            PFUser.logOut()
            print("user has logged out")
        }
        
        
    }
   
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

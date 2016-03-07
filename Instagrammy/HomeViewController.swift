//
//  HomeViewController.swift
//  Instagrammy
//
//  Created by Barbara Ristau on 3/5/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var postArr: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let query = PFQuery(className: "Post")
//        let post = PFObject(className: "Post")
//        Post["author"] = PFUser.currentUser()
        
        query.orderByDescending("_created_at")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.postArr = posts
                self.tableView.reloadData()
            } else {
               print(error?.localizedDescription)
            }
        }
        
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if postArr != nil{
            return postArr!.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
     
        let cell = tableView.dequeueReusableCellWithIdentifier("InstaCell", forIndexPath: indexPath) as! InstaCell
        let post = postArr![indexPath.row]
        cell.captionLabel.text = post["caption"] as? String

        cell.postImageView.file = post["media"] as? PFFile
        
        cell.postImageView.file = post["media"] as? PFFile
        cell.postImageView.loadInBackground()
        
//        if let postImageFile = post["post"] as? PFFile {
//        
//            postImageFile.getDataInBackgroundWithBlock {
//                (imageData: NSData?, error: NSError?) -> Void in
//                if error == nil {
//                    if let imageData = imageData{
//                        let image = UIImage(data: imageData)
//                        cell.postImageView.image = image
//                    }
//                }
       //     }
      //  }
        
        return cell
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

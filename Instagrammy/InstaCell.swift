//
//  InstaCell.swift
//  Instagrammy
//
//  Created by Barbara Ristau on 3/5/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstaCell: UITableViewCell {
    

    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

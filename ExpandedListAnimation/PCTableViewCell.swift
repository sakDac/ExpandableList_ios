//
//  PCTableViewCell.swift
//  ExpandedListAnimation
//
//  Created by admin1 on 15/05/17.
//  Copyright © 2017 admin1. All rights reserved.
//

import UIKit

class PCTableViewCell: UITableViewCell {


    @IBOutlet weak var parentTitle: UILabel!
    
    @IBOutlet weak var childDesc: UILabel!
    
    
    @IBOutlet weak var imageChild: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

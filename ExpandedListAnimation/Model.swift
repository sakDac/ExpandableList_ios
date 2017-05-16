//
//  Model.swift
//  ExpandedListAnimation
//
//  Created by admin1 on 15/05/17.
//  Copyright © 2017 admin1. All rights reserved.
//

import Foundation

class Model {
    
    var parentTitle : String?
    var childDescription : String?
    var isExpanded = true
    

    init(parent : String , childDesp : String) {
        self.parentTitle = parent
        self.childDescription = childDesp
    }
    
}

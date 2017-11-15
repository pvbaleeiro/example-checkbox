//
//  Option.swift
//  CheckBoxExample
//
//  Created by Victor Baleeiro on 15/11/17.
//  Copyright © 2017 Going2. All rights reserved.
//

import Foundation

class Option {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var name: String = ""
    var selected: Bool = false
    
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}

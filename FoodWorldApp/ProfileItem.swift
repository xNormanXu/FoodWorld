//
//  profileItem.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/23/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class ProfileItem {
    
    //MARK: Properties
    
    var name: String
    var image: UIImage
    
    //MARK: Initialization
    
    init?(name: String, image: UIImage) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.image = image
    }
    
}

//
//  SignUpViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // UI View Properties
    
    @IBOutlet weak var createAccountButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpPropertiesOfUIElement()
    }
    
    // Set up the UI Elements
    func setUpPropertiesOfUIElement() {
        
        // CREATE ACCOUNT BUTTON
        createAccountButtonOutlet.layer.cornerRadius = createAccountButtonOutlet.layer.frame.height / 2
        
    }

}

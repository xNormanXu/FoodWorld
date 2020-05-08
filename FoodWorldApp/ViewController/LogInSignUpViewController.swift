//
//  LogInSignUpViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/20/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class LogInSignUpViewController: UIViewController {
    
    // UI View Properties
    
    @IBOutlet weak var logInButtonOutlet: UIButton!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpPropertiesOfUIElement()
    }
    
    // Set up the UI Elements
    func setUpPropertiesOfUIElement() {
        
        // LOG IN BUTTON
        logInButtonOutlet.layer.cornerRadius = logInButtonOutlet.layer.frame.height / 2
        
        // SIGN UP BUTTON
        signUpButtonOutlet.layer.cornerRadius = signUpButtonOutlet.layer.frame.height / 2
        
    }

}

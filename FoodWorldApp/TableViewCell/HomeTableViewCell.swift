//
//  HomeTableViewCell.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var foodNameLabelOutlet: UILabel!
    
    @IBOutlet weak var foodIntroductionTextViewOutlet: UITextView!
    
    @IBOutlet weak var foodImageOutlet: UIImageView!
    
    @IBOutlet weak var thumbsUpButtonOutlet: UIButton!
    
    @IBOutlet weak var thumbsDownButtonOutlet: UIButton!
    
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        initializeButtonImage()
    }
    
    //MARK: Actions
    
    @IBAction func thumbsUpButtonAction(_ sender: Any) {

        if thumbsUpButtonOutlet.image(for: .normal) == UIImage(named: "thumbsUpOutlet.png") {
            thumbsUpButtonOutlet.setImage(UIImage(named: "thumbsUpFilled.png"), for: .normal)
        }
        else {
            thumbsUpButtonOutlet.setImage(UIImage(named: "thumbsUpOutlet.png"), for: .normal)
        }

    }

    @IBAction func thumbsDownButtonAction(_ sender: Any) {

        if thumbsDownButtonOutlet.image(for: .normal) == UIImage(named: "thumbsDownOutlet.png") {
            thumbsDownButtonOutlet.setImage(UIImage(named: "thumbsDownFilled.png"), for: .normal)
        }
        else {
            thumbsDownButtonOutlet.setImage(UIImage(named: "thumbsDownOutlet.png"), for: .normal)
        }

    }

    @IBAction func favoriteButtonAction(_ sender: Any) {

        if favoriteButtonOutlet.image(for: .normal) == UIImage(named: "favoriteOutlet.png") {
            favoriteButtonOutlet.setImage(UIImage(named: "favoriteFilled.png"), for: .normal)
        }
        else {
            favoriteButtonOutlet.setImage(UIImage(named: "favoriteOutlet.png"), for: .normal)
        }

    }

    //MARK: Private Methods

    private func initializeButtonImage() {

        thumbsUpButtonOutlet.setImage(UIImage(named: "thumbsUpOutlet.png"), for: .normal)
        thumbsDownButtonOutlet.setImage(UIImage(named: "thumbsDownOutlet.png"), for: .normal)
        favoriteButtonOutlet.setImage(UIImage(named: "favoriteOutlet.png"), for: .normal)

    }
    
}

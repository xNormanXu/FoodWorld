//
//  ProfileViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    @IBOutlet weak var profileTableViewOutlet: UITableView!
    
    var profileItems = [ProfileItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileTableViewOutlet.delegate = self
        profileTableViewOutlet.dataSource = self
        
        loadSampleItems()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell", for: indexPath) as! ProfileTableViewCell
        
        let profileItem = profileItems[indexPath.row]
        
        profileTableViewCell.profileItemNameLabelOutlet.text = profileItem.name
        profileTableViewCell.profileItemImageOutlet.image = profileItem.image
        
        return profileTableViewCell
    }
    
    //MARK: Private Methods
    
    private func loadSampleItems() {
        
        let name1 = "(111) 222-3333"
        let name2 = "Jason@gmail.com"
        let name3 = "Have a nice day!"
        let name4 = "Sushi"
        let name5 = "Log out"
        let name6 = "Setting"
        
        let image1 = UIImage(named: "mobileFilled.png")!
        let image2 = UIImage(named: "emailFilled.png")!
        let image3 = UIImage(named: "penFilled.png")!
        let image4 = UIImage(named: "favoriteFilled.png")!
        let image5 = UIImage(named: "logOutFilled.png")!
        let image6 = UIImage(named: "settingFilled.png")!

        guard let profileItem1 = ProfileItem(name: name1, image: image1) else {
            fatalError("Unable to instantiate profileItem1")
        }
        
        guard let profileItem2 = ProfileItem(name: name2, image: image2) else {
            fatalError("Unable to instantiate profileItem2")
        }
        
        guard let profileItem3 = ProfileItem(name: name3, image: image3) else {
            fatalError("Unable to instantiate profileItem3")
        }
        
        guard let profileItem4 = ProfileItem(name: name4, image: image4) else {
            fatalError("Unable to instantiate profileItem4")
        }
        
        guard let profileItem5 = ProfileItem(name: name5, image: image5) else {
            fatalError("Unable to instantiate profileItem5")
        }
        
        guard let profileItem6 = ProfileItem(name: name6, image: image6) else {
            fatalError("Unable to instantiate profileItem6")
        }
        
        profileItems += [profileItem1, profileItem2, profileItem3, profileItem4, profileItem5, profileItem6]
        
    }

}

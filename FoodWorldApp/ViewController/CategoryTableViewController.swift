//
//  CategoryTableViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let categories = ["Appetizer", "Beverages", "Breakfast", "Dessert", "Pasta", "Meat", "Salad", "Soup", "Main dish"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let category = categories[indexPath.row]
        
        categoryTableViewCell.categoryLabelOutlet.text = category
        
        return categoryTableViewCell
    }

}

//
//  FavoriteTableViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: Properties
    
    @IBOutlet var favoriteTableViewOutlet: UITableView!
    
    var foods = [Food]()
    var favoriteFoods = [Food]()
    var currentFavoriteFoods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let savedFoods = loadFoods() {
            foods += savedFoods
        }
        
        favoriteFoods = foods.filter({ food -> Bool in
            food.preference == "favorite"
        })
        
        currentFavoriteFoods = favoriteFoods
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFavoriteFoods.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favoriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "favoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        
        let food = currentFavoriteFoods[indexPath.row]
        
        favoriteTableViewCell.foodNameLabelOutlet.text = food.name
        favoriteTableViewCell.foodIntroductionTextViewOutlet.text = food.introduction
        favoriteTableViewCell.foodImageOutlet.image = food.image
        
        return favoriteTableViewCell
    }
    
    // Search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentFavoriteFoods = favoriteFoods.filter({ food -> Bool in
            if searchText.isEmpty {
                return true
            }
            return food.name.lowercased().contains(searchText.lowercased())
        })
        
        favoriteTableViewOutlet.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        currentFavoriteFoods = favoriteFoods
        favoriteTableViewOutlet.reloadData()
    }
    
    //MARK: Private Methods
    
    private func saveFoods() {
        NSKeyedArchiver.archiveRootObject(foods, toFile: Food.ArchiveURL.path)
    }
    
    private func loadFoods() -> [Food]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Food.ArchiveURL.path) as? [Food]
    }

}

//
//  HomeTableViewController.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: Properties
    
    @IBOutlet var homeTableViewOutlet: UITableView!
    
    var foods = [Food]()
    var currentFoods = [Food]() // used to update table

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        homeTableViewOutlet.delegate = self
        homeTableViewOutlet.dataSource = self
        
        // Load any saved foods, otherwise load sample data.
        if let savedFoods = loadFoods() {
            foods += savedFoods
        }
        else {
            // Load the sample data.
            loadSampleFoods()
        }
        currentFoods = foods
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFoods.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! HomeTableViewCell
        let food = currentFoods[indexPath.row]
        
        homeTableViewCell.foodNameLabelOutlet.text = food.name
        homeTableViewCell.foodIntroductionTextViewOutlet.text = food.introduction
        homeTableViewCell.foodImageOutlet.image = food.image
        
        if food.preference == "regular" {
            homeTableViewCell.favoriteButtonOutlet.setImage(UIImage(named: "favoriteOutlet.png"), for: .normal)
        } else {
            homeTableViewCell.favoriteButtonOutlet.setImage(UIImage(named: "favoriteFilled.png"), for: .normal)
        }
        
        saveFoods()
        return homeTableViewCell
    }
    
    // Search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentFoods = foods.filter({ food -> Bool in
            if searchText.isEmpty {
                return true
            }
            return food.name.lowercased().contains(searchText.lowercased())
        })
        
        homeTableViewOutlet.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        currentFoods = foods
        homeTableViewOutlet.reloadData()
    }
    
    //MARK: Private Methods
    
    private func loadSampleFoods() {
        
        let name1 = "Caprese Salad"
        let name2 = "Chicken and Potatoes"
        let name3 = "Pasta with Meatballs"
        let name4 = "Sushi"
        let name5 = "Mochi"
        let name6 = "Macaron"
        
        let introduction1 = "Caprese salad is a simple Italian salad, made of sliced fresh mozzarella, tomatoes, and sweet basil, seasoned with salt and olive oil, occasionally paired with arugula."
        let introduction2 = "Chicken and potatoes is a combination of foods predominantly consumed in the United Kingdom, and United States. It consists of a piece of  fried or roasted chicken and potatoes."
        let introduction3 = "Spaghetti and meatballs or spaghetti with meatballs is an Italian-American delicious food consisting of spaghetti, tomato sauce and meatballs. It is very popular in the world."
        let introduction4 = "Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanying a variety of ingredients, such as seafood, vegetables, and fruits. "
        let introduction5 = "Mochi is Japanese rice cake made of mochigome, a short-grain japonica glutinous rice, and sometimes other ingredients such as water, sugar, and cornstarch."
        let introduction6 = "A macaron or French macaroon is a sweet meringue-based confection made with egg white, icing sugar, granulated sugar, almond meal, and food coloring."
        
        let image1 = UIImage(named: "capreseSalad.png")!
        let image2 = UIImage(named: "chickenAndPotatoes.png")!
        let image3 = UIImage(named: "pastaWithMeatballs.png")!
        let image4 = UIImage(named: "sushi.jpg")!
        let image5 = UIImage(named: "mochi.jpg")!
        let image6 = UIImage(named: "macaron.jpg")!

        guard let food1 = Food(name: name1, category: "salad", preference: "regular", introduction: introduction1, image: image1) else {
            fatalError("Unable to instantiate food1")
        }

        guard let food2 = Food(name: name2, category: "mixed", preference: "regular", introduction: introduction2, image: image2) else {
            fatalError("Unable to instantiate food2")
        }

        guard let food3 = Food(name: name3, category: "pasta", preference: "regular", introduction: introduction3, image: image3) else {
            fatalError("Unable to instantiate food3")
        }
        
        guard let food4 = Food(name: name4, category: "rice", preference: "regular", introduction: introduction4, image: image4) else {
            fatalError("Unable to instantiate food4")
        }
        
        guard let food5 = Food(name: name5, category: "dessert", preference: "favorite", introduction: introduction5, image: image5) else {
            fatalError("Unable to instantiate food5")
        }
        
        guard let food6 = Food(name: name6, category: "dessert", preference: "favorite", introduction: introduction6, image: image6) else {
            fatalError("Unable to instantiate food6")
        }

        foods += [food1, food2, food3, food4, food5, food6]
        
    }
    
    private func saveFoods() {
        NSKeyedArchiver.archiveRootObject(foods, toFile: Food.ArchiveURL.path)
    }
    
    private func loadFoods() -> [Food]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Food.ArchiveURL.path) as? [Food]
    }
    
}

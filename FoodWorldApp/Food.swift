//
//  Food.swift
//  FoodWorldApp
//
//  Created by Jiawei Xu on 4/21/20.
//  Copyright © 2020 Jiawei Xu. All rights reserved.
//

import UIKit

class Food: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var category: String
    var preference: String
    var introduction: String
    var image: UIImage
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tasks")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let category = "category"
        static let preference = "preference"
        static let introduction = "introduction"
        static let image = "image"
    }
    
    //MARK: Initialization
    
    init?(name: String, category: String, preference: String, introduction: String, image: UIImage) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The category must not be empty
        guard !category.isEmpty else {
            return nil
        }
        
        // The preference must not be empty
        guard !preference.isEmpty else {
            return nil
        }
        
        // The description must not be empty
        guard !introduction.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.category = category
        self.preference = preference
        self.introduction = introduction
        self.image = image
    }
    
    //MARK: NSCoding
    
    required convenience init?(coder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        
        // The category is required. If we cannot decode a category string, the initializer should fail.
        guard let category = coder.decodeObject(forKey: PropertyKey.category) as? String else {
            return nil
        }
        
        // The preference is required. If we cannot decode a preference string, the initializer should fail.
        guard let preference = coder.decodeObject(forKey: PropertyKey.preference) as? String else {
            return nil
        }
        
        // The preference is required. If we cannot decode a preference string, the initializer should fail.
        guard let introduction = coder.decodeObject(forKey: PropertyKey.introduction) as? String else {
            return nil
        }
        
        // The preference is required. If we cannot decode a preference string, the initializer should fail.
        guard let image = coder.decodeObject(forKey: PropertyKey.image) as? UIImage else {
            return nil
        }
        
        // Must call designated initializer.
        self.init(name: name, category: category, preference: preference, introduction: introduction, image: image)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(category, forKey: PropertyKey.category)
        coder.encode(preference, forKey: PropertyKey.preference)
        coder.encode(introduction, forKey: PropertyKey.introduction)
        coder.encode(image, forKey: PropertyKey.image)
    }
    
}

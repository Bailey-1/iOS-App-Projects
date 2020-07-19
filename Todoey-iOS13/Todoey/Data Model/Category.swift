//
//  Category.swift
//  Todoey
//
//  Created by Bailey Search on 19/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

// Type realm object
class Category: Object {
    // Specify properties
    @objc dynamic var name: String = ""
    @objc dynamic var hexBackgroundColor: String = ""
    // Specify list of items to allow for one => multiple
    let items = List<Item>()
}

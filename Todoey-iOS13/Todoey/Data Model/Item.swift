//
//  Item.swift
//  Todoey
//
//  Created by Bailey Search on 19/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    // Inverse relationship to link item to parent category
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

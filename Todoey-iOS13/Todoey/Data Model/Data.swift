//
//  Data.swift
//  Todoey
//
//  Created by Bailey Search on 18/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    // Use dynamic to allow realm to monitor for changes
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}

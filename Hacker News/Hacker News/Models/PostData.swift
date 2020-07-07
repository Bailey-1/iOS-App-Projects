//
//  PostData.swift
//  Hacker News
//
//  Created by Bailey Search on 07/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}

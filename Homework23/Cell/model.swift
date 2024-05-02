//
//  model.swift
//  Homework23
//
//  Created by Nodiko Gachava on 03.05.24.
//

import Foundation

struct Facts: Decodable {
    var fact: String
    var length: Int
}
 
struct CatInfo: Decodable {
    var data: [Facts]
}


//
//  Entity.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 10/08/22.
//

import Foundation

// Model
struct Response: Codable {
    var success: Bool = true
    var message: String = ""
    var prevPage: Int? = nil
    var nextPage: Int? = nil
    var hunters: [Hunter] = []
}

struct Hunter: Codable {
    var id: Int
    var name: String
}

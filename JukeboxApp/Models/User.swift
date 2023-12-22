//
//  User.swift
//  JukeboxApp
//
//  Created by Yuri Fonseca on 20/12/23.
//

import Foundation

class User {
    let id: Int
    var name: String
    var credits: Int
    var age: Int?
    
    init(id: Int, name: String, credits: Int, age: Int? = nil) {
        self.id = id
        self.name = name
        self.credits = credits
        self.age = age
    }
}

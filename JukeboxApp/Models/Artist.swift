//
//  Artist.swift
//  JukeboxApp
//
//  Created by Yuri Fonseca on 20/12/23.
//

import Foundation

class Artist {
    let id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func description () -> String {
        return " \(name) (ID: \(id))"
    }
    
}

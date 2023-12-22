//
//  Music.swift
//  JukeboxApp
//
//  Created by Yuri Fonseca on 20/12/23.
//

import Foundation

class Music {
    let id: Int
    var name: String
    var artist: Artist
    var duration: Float
    var score: String?
    var timesPlayed: Int
    
    init(id: Int, name: String, artist: Artist, duration: Float, score: String? = nil, timesPlayed: Int = 0) {
        self.id = id
        self.name = name
        self.artist = artist
        self.duration = duration
        self.score = score
        self.timesPlayed = timesPlayed
    }
    
    func description() -> String {
        let message = " ID: \(id) Name: \(name) Artist: \(artist.description())"
        return message
    }
}

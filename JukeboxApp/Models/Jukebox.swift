//
//  Jukebox.swift
//  JukeboxApp
//
//  Created by Yuri Fonseca on 20/12/23.
//

import Foundation

class Jukebox {
    var availableMusics = [Music]()
    var musicsToPlay = [Music]()
    var musicPrice: Int = 10
    
    init() {
        setupJukebox()
    }
    
    func setupJukebox() {
        let artists = [
            Artist(id: 0, name: "Elvis Presley"),
            Artist(id: 1, name: "Queen"),
            Artist(id: 2, name: "O Rappa"),
            Artist(id: 3, name: "The Weeknd"),
            Artist(id: 4, name: "Mamonas Assassinas")
        ]

        availableMusics = [
            Music(id: 0, name: "Hound Dog", artist: artists[0], duration: 2.16),
            Music(id: 1, name: "Somebody to Love", artist: artists[1], duration: 4.55, score: "8.2"),
            Music(id: 2, name: "O que sobrou do céu", artist: artists[2], duration: 4.10, score: "7.5"),
            Music(id: 3, name: "Auto-reverse", artist: artists[2], duration: 4.45),
            Music(id: 4, name: "Blinding Lights", artist: artists[3], duration: 3.21),
            Music(id: 3, name: "Vira-vira", artist: artists[4], duration: 2.23),
        ]
    }
    
    func playMusic(id: Int) {
        if let music = searchMusicBy(id: id) {
            print(music.description())
        } else {
            print("Music not available to play")
        }
    }
    
    func getDescriptionOfMusics() -> String? {
        let concatenatedString = musicsToPlay.map { $0.description() }.joined(separator: " " + "\n")
        return concatenatedString
    }
    
    func selectMusicBy(id: Int, user: User) -> String? {
        if (user.credits >= musicPrice){
            if let music = searchMusicBy(id: id) {
                user.credits -= musicPrice
                music.timesPlayed += 1
                musicsToPlay.append(music)
                return "Music added to queue"
            }
            return "Music not found"
        }
        return "Insufficient credit!"
    }
    
    func selectMusicBy(name: String, user: User) -> String? {
        if (user.credits >= musicPrice){
            if let music = searchMusicBy(name: name) {
                user.credits -= musicPrice
                music.timesPlayed += 1
                musicsToPlay.append(music)
                return "Music added to queue"
            }
            return "Music not found"
        }
        return "Insufficient credit!"
    }
    
    func searchMusicBy(id: Int) -> Music? {
        return availableMusics.first { $0.id == id }
    }
    
    func searchMusicBy(name: String) -> Music? {
        return availableMusics.first { $0.name == name }
    }
    
    func searchAllAvailableMusics() -> [Music] {
        return availableMusics
    }
    
    func searchMusicByArtist(id: Int) -> [Music] {
        let artistMusics = availableMusics.filter { music in
            music.artist.id == id
        }
        
        return artistMusics
    }

    func searchMusicByArtist(name: String) -> [Music] {
        let artistMusics = availableMusics.filter { music in
            music.artist.name == name
        }
        
        return artistMusics
    }
    
    func removeMusic(name: String) {
        if let indexToRemove = musicsToPlay.firstIndex(where: {$0.name == name}){
            musicsToPlay.remove(at: indexToRemove)
        }
    }
    
    func mostPlayedMusics() -> [Music] {
        let vector = availableMusics.sorted(by: {$0.timesPlayed > $1.timesPlayed})
        return vector.filter {music in music.timesPlayed > 0}
    }
    
    func getMusicsToPlay() -> [Music] {
        return musicsToPlay
    }

    
}

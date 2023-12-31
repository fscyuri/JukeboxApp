//
//  ViewController.swift
//  JukeboxApp
//
//  Created by Yuri Fonseca on 18/12/23.
//

import UIKit

class ViewController: UIViewController {

    let myJukebox = Jukebox()
    let user = User(id: 0, name: "Yuri", credits: 70)
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userCredits: UILabel!
    
    /*
     List of available musics to search:
     1. Hound Dog
     2. Somebody to Love
     3. O que sobrou do ceu
     4. Auto-reverse
     5. Blinding Lights
     6. Vira-vira
    */
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        startSearch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCredits.text = "User credit balance: \(user.credits)"
    }
    
    func startSearch(){
        
        guard let searchText = searchTextField.text else {
            return
        }
        
        if let foundMusic = myJukebox.selectMusicBy(name: searchText, user: user) {
            messageLabel.text = foundMusic
        }
        
        
        if let description = myJukebox.getDescriptionOfMusics() {
            descriptionLabel.text = description
        } else {
            descriptionLabel.text = "Description not found"
        }
        
        userCredits.text = String("User credit balance: \(user.credits)")
        
        
    }
    

}


//
//  MusicViewController.swift
//  UIKitStuff
//
//  Created by joseph wright on 1/23/26.
//

import UIKit

class LooseYourselfViewController: UIViewController {
    let looseYourself = SongLyrics.looseYourselfLyrics.split { $0.isWhitespace }.map(String.init)
    var currentWord = 0
    @IBOutlet weak var nextWordButton: UIButton!
    @IBOutlet weak var OneWord: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        OneWord.font = UIFont(name: "Impact", size: 50)
        OneWord.text = "Loose Yourself"
    }
    
    @IBAction func NextWord(_ sender: Any) {
        currentWord += 1
        OneWord.text = looseYourself[currentWord - 1]
    }
}

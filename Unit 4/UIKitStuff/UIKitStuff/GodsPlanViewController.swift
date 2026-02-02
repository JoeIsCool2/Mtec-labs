//
//  LooseYourselfViewController 2.swift
//  UIKitStuff
//
//  Created by joseph wright on 1/23/26.
//


import UIKit

class GodsPlanViewController: UIViewController {
    let GodsPlan = SongLyrics.GodsPlanLyrics.split { $0.isWhitespace }.map(String.init)
    var currentWord = 0
    @IBOutlet weak var nextWordButton: UIButton!
    @IBOutlet weak var OneWord: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        OneWord.font = UIFont(name: "Impact", size: 50)
        OneWord.text = "Gods Plan"
    }
    
    @IBAction func NextWord(_ sender: Any) {
        currentWord += 1
        OneWord.text = GodsPlan[currentWord - 1]
    }
}

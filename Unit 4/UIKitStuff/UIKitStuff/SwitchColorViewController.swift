//
//  SwitchColorViewController.swift
//  UIKitStuff
//
//  Created by joseph wright on 1/23/26.
//


import UIKit

class SwitchColorViewController: UIViewController {
    var isColorChanged = false
    @IBOutlet weak var changeColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeColor(_ sender: Any) {
        isColorChanged.toggle()
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = self.isColorChanged ? .white : .blue
        }
    }
}

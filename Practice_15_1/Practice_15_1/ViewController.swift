//
//  ViewController.swift
//  Practice_15_1
//
//  Created by Алина Ненашева on 10/19/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var menuViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    var stateOfMenu = false
    @IBOutlet weak var blurViewController: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        menuViewLeadingConstraint.constant = -view.frame.width/2 + 50
        menuViewWidthConstraint.constant = view.frame.width/2
        blurViewController.alpha = 1
        
    }

    @IBAction func menuButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            if self.stateOfMenu {
                self.blurViewController.alpha = 0
                self.menuViewLeadingConstraint.constant = -self.view.frame.width/2 + 50
                self.stateOfMenu = false
            } else {
                self.blurViewController.alpha = 1
                self.menuViewLeadingConstraint.constant = 0
                self.stateOfMenu = true
            }
        }
    }
    
}


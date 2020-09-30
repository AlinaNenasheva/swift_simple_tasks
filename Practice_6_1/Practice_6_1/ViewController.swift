//
//  ViewController.swift
//  Practice_6_1
//
//  Created by Алина Ненашева on 9/15/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blackSquareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        blackSquareView.layer.cornerRadius = blackSquareView.frame.width/2
        blackSquareView.layer.masksToBounds = true

        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)

    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let newCoordinates = (x: Int.random(in: 0..<Int(view.frame.width - blackSquareView.frame.width)), y: Int.random(in: 0..<Int(view.frame.height - blackSquareView.frame.height)))
            blackSquareView.frame.origin.x = CGFloat(newCoordinates.x)
            blackSquareView.frame.origin.y = CGFloat(newCoordinates.y)
    }
    
}


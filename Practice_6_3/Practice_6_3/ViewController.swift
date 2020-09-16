//
//  ViewController.swift
//  Practice_6_3
//
//  Created by Алина Ненашева on 9/16/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var blueBallView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        blueBallView.layer.cornerRadius = blueBallView.frame.width/2
        
    }

    @IBAction func upButtonPressed(_ sender: Any) {
        if blueBallView.frame.origin.y - 20 >= 0 {
            blueBallView.frame.origin.y -= 20
        }
    }
          
    @IBAction func downButtonPressed(_ sender: Any) {
        if blueBallView.frame.origin.y + blueBallView.frame.height + 20 <= view.frame.height - buttonView.frame.height {
            blueBallView.frame.origin.y += 20
        }
        
    }

    
    @IBAction func rightButtonPressed(_ sender: Any) {
        if blueBallView.frame.origin.x + blueBallView.frame.width + 20 <= view.frame.width {
            blueBallView.frame.origin.x += 20
        }
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        if blueBallView.frame.origin.x - 20 >= 0 {
            blueBallView.frame.origin.x -= 20
        }
    }
}


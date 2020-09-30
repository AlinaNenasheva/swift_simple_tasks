//
//  ViewController.swift
//  Practice_8_1
//
//  Created by Алина Ненашева on 9/22/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextViewButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: SecondViewController.self)) as! SecondViewController
        viewController.text = greetingLabel.text!
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


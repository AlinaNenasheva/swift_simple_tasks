//
//  SecondViewController.swift
//  Practice_8_1
//
//  Created by Алина Ненашева on 9/22/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var text = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextViewButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: ThirdViewController.self)) as! ThirdViewController
        viewController.text = text
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

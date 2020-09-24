//
//  ViewController.swift
//  Practice_8_2
//
//  Created by Алина Ненашева on 9/24/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var country = Country(name: "Belarus", area: 207.6, timeZone: 3)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: SecondViewController.self)) as! SecondViewController
        viewController.country = country
        self.present(viewController, animated: true)
    }
    

}


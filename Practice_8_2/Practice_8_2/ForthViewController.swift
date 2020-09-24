//
//  ForthViewController.swift
//  Practice_8_2
//
//  Created by Алина Ненашева on 9/24/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    var country = Country()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: FifthViewController.self)) as! FifthViewController
        viewController.country = country
        self.present(viewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

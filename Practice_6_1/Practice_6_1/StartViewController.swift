//
//  StartViewController.swift
//  Practice_6_1
//
//  Created by Алина Ненашева on 9/21/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func startButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showPawTapGame", sender: self)
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

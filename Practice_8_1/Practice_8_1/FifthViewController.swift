//
//  FifthViewController.swift
//  Practice_8_1
//
//  Created by Алина Ненашева on 9/22/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    var finalGreetingLabel: UILabel = UILabel(frame: CGRect(x: 200, y: 300, width: 200, height: 21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(finalGreetingLabel)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackButtonPressed(_ sender: Any) {
         navigationController?.popToRootViewController(animated: true)
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

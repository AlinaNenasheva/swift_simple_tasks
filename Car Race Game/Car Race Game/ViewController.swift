//
//  ViewController.swift
//  Car Race Game
//
//  Created by Алина Ненашева on 9/22/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startGameViewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self))
        startGameViewController.modalPresentationStyle = .fullScreen
        self.present(startGameViewController, animated: true)
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyboard.instantiateViewController(identifier: String(describing: SettingsViewController.self))
                settingsViewController.modalPresentationStyle = .fullScreen
        self.present(settingsViewController, animated: true)
    }
    
    @IBAction func recordsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recordsViewController = storyboard.instantiateViewController(identifier: String(describing: RecordsViewController.self))
                recordsViewController.modalPresentationStyle = .fullScreen
        self.present(recordsViewController, animated: true)
    }
}


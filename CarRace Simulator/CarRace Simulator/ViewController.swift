//
//  ViewController.swift
//  CarRace Simulator
//
//  Created by Алина Ненашева on 10/1/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        menuView.layer.cornerRadius = 10
        menuView.setShadow()
        menuView.setGradient(colors: [UIColor.red.cgColor, UIColor.gray.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        // Do any additional setup after loading the view.
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startGameViewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self))
        startGameViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(startGameViewController, animated: true)
    }
    
    @IBAction func recordsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recordsViewController = storyboard.instantiateViewController(identifier: String(describing: RecordsViewController.self))
        recordsViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(recordsViewController, animated: true)
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyboard.instantiateViewController(identifier: String(describing: SettingsViewController.self))
        settingsViewController.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
}


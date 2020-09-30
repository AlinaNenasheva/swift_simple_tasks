//
//  ViewController.swift
//  Practice_9_2
//
//  Created by Алина Ненашева on 9/28/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var views: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(processTap(_:)))
        view.addGestureRecognizer(gesture)
    }

    @objc func processTap(_ gesture: UITapGestureRecognizer){
        if !views.isEmpty {
            for view in views {
                view.backgroundColor = .white
            }
        }
        let point = gesture.location(in: view)
        let newRoundView = UIView(frame: CGRect(x: CGFloat(point.x) - 50, y: CGFloat(point.y) - 50, width: 100, height: 100))
        newRoundView.backgroundColor = .black
        newRoundView.layer.cornerRadius = newRoundView.frame.width/2
        newRoundView.layer.masksToBounds = true
        views.append(newRoundView)
        view.addSubview(newRoundView)
    }
    
}


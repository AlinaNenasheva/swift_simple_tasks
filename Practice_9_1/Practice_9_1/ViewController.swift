//
//  ViewController.swift
//  Practice_9_1
//
//  Created by Алина Ненашева on 9/28/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blackRoundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        blackRoundView.layer.cornerRadius = blackRoundView.frame.width/2
        blackRoundView.layer.masksToBounds = true
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(processPan(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
    }

    @objc func processPan(_ panGesture: UIPanGestureRecognizer){
        let point = panGesture.location(in: view)
        if(CGFloat(point.x) <= view.frame.width || CGFloat(point.x) >= 0) {
            blackRoundView.frame.origin.x = CGFloat(point.x) - blackRoundView.frame.width/2
        }
        if(CGFloat(point.y) <= view.frame.height || CGFloat(point.y) >= 0 ) {
            blackRoundView.frame.origin.y = CGFloat(point.y) - blackRoundView.frame.height/2
            
        }
    }

}


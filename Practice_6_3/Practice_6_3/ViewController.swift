//
//  ViewController.swift
//  Practice_6_3
//
//  Created by Алина Ненашева on 9/16/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var blueBallView: UIView!
    
    let directionLabel = UILabel()
    
    enum Direction {
        case up
        case down
        case right
        case left
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueBallView.layer.cornerRadius = blueBallView.frame.width/2
        directionLabel.frame = CGRect(x: blueBallView.frame.width/2 - 13, y: blueBallView.frame.height/2 - 10, width: 50, height: 25)
        blueBallView.addSubview(directionLabel)
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        leftSwipeGesture.direction = .left
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        upSwipeGesture.direction = .up
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .down
        view.addGestureRecognizer(upSwipeGesture)
        view.addGestureRecognizer(downSwipeGesture)
        view.addGestureRecognizer(leftSwipeGesture)
        view.addGestureRecognizer(rightSwipeGesture)
    }
    
    @objc func processSwipe(_ swipeGesture: UISwipeGestureRecognizer){
        switch swipeGesture.direction{
        case .left:
            toRightDirectionMove(.left)
        case .right:
            toRightDirectionMove(.right)
        case .up:
            toRightDirectionMove(.up)
        case .down:
            toRightDirectionMove(.down)
        default:
            print("")
        }
    }
    
    @IBAction func upButtonPressed(_ sender: Any) {
        toRightDirectionMove(.up)
    }
    
    @IBAction func downButtonPressed(_ sender: Any) {
        toRightDirectionMove(.down)
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        toRightDirectionMove(.right)
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        toRightDirectionMove(.left)
    }
    
    private func toRightDirectionMove(_ direction: Direction) {
        switch direction {
        case .up:
            if blueBallView.frame.origin.y - 20 >= 0 {
                blueBallView.frame.origin.y -= 20
                directionLabel.text = "up"
            }
        case .down:
            if   blueBallView.frame.origin.y + blueBallView.frame.height + 20 <= view.frame.height - buttonView.frame.height {
                blueBallView.frame.origin.y += 20
                directionLabel.text = "down"
                
            }
        case .right:
            if blueBallView.frame.origin.x + blueBallView.frame.width + 20 <= view.frame.width {
                blueBallView.frame.origin.x += 20
                directionLabel.text = "right"
            }
        case .left:
            if blueBallView.frame.origin.x - 20 >= 0 {
                blueBallView.frame.origin.x -= 20
                directionLabel.text = "left"
            }
        }
    }
    
}


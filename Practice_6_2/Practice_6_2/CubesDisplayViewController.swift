//
//  CubesDisplayViewController.swift
//  Practice_6_2
//
//  Created by Алина Ненашева on 9/21/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class CubesDisplayViewController: UIViewController {

    var size = 0
    var x = 0
    var y = 0

    var squareViews: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        createSquare()
    }
    
    func createSquare(){
        let newSquareView = UIView()
        newSquareView.frame = CGRect(x: x, y: y, width: size, height: size)
        x += size
        if CGFloat(x + size) > view.frame.width {
            let newSquareView = UIView()
            newSquareView.frame = CGRect(x: x, y: y, width: size, height: size)
            newSquareView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            squareViews.append(newSquareView)
            x += size
            y += size
            x = 0
        }
        newSquareView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        squareViews.append(newSquareView)
        if CGFloat(y + size) < view.frame.height {
            createSquare()
        } else {
            for tempView in squareViews{
                view.addSubview(tempView)
            }
            return
        }
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

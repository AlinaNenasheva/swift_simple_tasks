//
//  FifthViewController.swift
//  Practice_8_2
//
//  Created by Алина Ненашева on 9/24/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    var country = Country()
    
    var nameLabel = UILabel(frame: CGRect(x: 100, y: 250, width: 200, height: 21))
    var areaLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 21))
    var timeZoneLabel = UILabel(frame: CGRect(x: 100, y: 350, width: 200, height: 21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Country's name is " + country.name
        areaLabel.text = "Country's area is " + String(country.area)
        timeZoneLabel.text = "Country's time zone is " + String(country.timeZone)
        view.addSubview(nameLabel)
        view.addSubview(areaLabel)
        view.addSubview(timeZoneLabel)
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

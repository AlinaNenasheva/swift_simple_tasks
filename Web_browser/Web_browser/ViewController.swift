//
//  ViewController.swift
//  Web_browser
//
//  Created by Алина Ненашева on 11/8/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    var urlsArray = [URL]()
    
    @IBOutlet weak var webView: WKWebView!
    var currentWebPage = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveHistory()
        backButton.isEnabled = false
        forwardButton.isEnabled = false
    }
    
    func checkPagination() {
        forwardButton.isEnabled = true
        backButton.isEnabled = true
        if currentWebPage == 0 {
            backButton.isEnabled = false
        }
        if currentWebPage == urlsArray.count - 1 {
            forwardButton.isEnabled = false
        }
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        currentWebPage -= 1
        checkPagination()
            webView.load(URLRequest(url: urlsArray[currentWebPage]))

    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        currentWebPage += 1
        checkPagination()
            webView.load(URLRequest(url: urlsArray[currentWebPage]))
    }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        if urlTextField.text != "" {
            if let newURL = URL(string: urlTextField.text!) {
                urlsArray.append(newURL)
                webView.load(URLRequest(url: newURL))
                currentWebPage += 1
                checkPagination()
                saveHistory()
            }
        }
        
    }
    
    func saveHistory() {
        let archived = try! PropertyListEncoder().encode(urlsArray)
        UserDefaults.standard.set(archived, forKey: "URLsArray")
    }
    
    func retriveHistory() {
        urlsArray = UserDefaults.standard.object(forKey: "URLsArray") as? [URL] ?? [URL]()
    }
}



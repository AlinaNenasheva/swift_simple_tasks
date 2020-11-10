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
    var urlStrings = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveHistory()
        checkPagination()
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
                if newURL != urlsArray.last {
                    urlsArray.append(newURL)
                    urlStrings.append(newURL.absoluteString)
                    webView.load(URLRequest(url: newURL))
                    currentWebPage += 1
                    checkPagination()
                    saveHistory()
                    
                }
            }
        }
        
    }
    
    func saveHistory() {
        do{
            let data = try JSONEncoder().encode(urlStrings)
            UserDefaults.standard.setValue(data, forKey: "URLsKey")
        } catch {
            print(error)
        }
    }
    
    func retriveHistory() {
            if let data = UserDefaults.standard.value(forKey: "URLsKey") as? Data {
            do{
                urlStrings = try JSONDecoder().decode([String].self, from: data)
            } catch {
                print(error)
            }
        }
        for url in urlStrings {
            if let url = URL(string: url) {
                urlsArray.append(url)
            }
        }
        if let lastURL = urlsArray.last {
            webView.load(URLRequest(url: lastURL))
        }
        currentWebPage = urlsArray.count - 1
}

}


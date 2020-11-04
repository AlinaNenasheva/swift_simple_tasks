//
//  ViewController.swift
//  Instagramish_App
//
//  Created by Алина Ненашева on 11/3/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var imageOne : UIImageView!
    var imageTwo : UIImageView!
    @IBOutlet weak var commentSectionTextView: UITextView!
    var pictures = ["image1": ImageProperties(), "image2": ImageProperties(), "image3": ImageProperties(), "image4": ImageProperties()]
    var imgArr = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4")]
    
    @IBOutlet weak var leaveCommentTextField: UITextField!
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageOne = UIImageView(frame: CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: view.frame.height - likeButton.frame.origin.y))
        imageTwo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - likeButton.frame.origin.y))
        imageTwo.image = UIImage(named: "image1")
        imageOne.contentMode = .scaleAspectFill
        imageTwo.contentMode = .scaleAspectFill
        view.addSubview(imageOne)
        view.addSubview(imageTwo)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        leftSwipeGesture.direction = .left
        scrollView.addGestureRecognizer(leftSwipeGesture)

        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        scrollView.addGestureRecognizer(rightSwipeGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func handleKeyboardDidShow(_ notification: Notification) {
        if let keyboard = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect {
            let bottomInset = keyboard.height
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            scrollView.contentInset = insets
            
        }
    }
    
    func swipeLeft() {
        if currentPage == 3 {
            moveImagesForLeft(nextPage: 0)
            currentPage = 0
        } else {
            moveImagesForLeft(nextPage: currentPage + 1)
            currentPage += 1
        }
    }
    
    func swipeRight() {
        if currentPage == 0 {
            moveImagesForRight(previousPage: 3)
            currentPage = 3
        } else {
            moveImagesForRight(previousPage: currentPage - 1)
            currentPage -= 1
        }
    }
    
    func moveImagesForRight(previousPage: Int) {
        if imageTwo.frame.origin.x == view.frame.width {
            imageTwo.frame.origin.x = -view.frame.width
            imageTwo.image = imgArr[previousPage]
            UIView.animate(withDuration: 0.5) {
                self.imageTwo.frame.origin.x = 0
                self.imageOne.frame.origin.x = self.view.frame.width
            }
        } else if imageOne.frame.origin.x == view.frame.width {
            imageOne.frame.origin.x = -view.frame.width
            imageOne.image = imgArr[previousPage]
            UIView.animate(withDuration: 0.5) {
                self.imageOne.frame.origin.x = 0
                self.imageTwo.frame.origin.x = self.view.frame.width
            }
        } else if imageTwo.frame.origin.x == -view.frame.width {
            imageTwo.image = imgArr[previousPage]
            UIView.animate(withDuration: 0.5) {
                self.imageTwo.frame.origin.x = 0
                self.imageOne.frame.origin.x = self.view.frame.width
            }
        } else if imageOne.frame.origin.x == -view.frame.width {
            imageOne.image = imgArr[previousPage]
            UIView.animate(withDuration: 0.5) {
                self.imageOne.frame.origin.x = 0
                self.imageTwo.frame.origin.x = self.view.frame.width
            }
        }
    }
    
    func moveImagesForLeft(nextPage: Int) {
        if imageTwo.frame.origin.x == -view.frame.width {
            imageTwo.frame.origin.x = view.frame.width
            imageTwo.image = imgArr[nextPage]
            UIView.animate(withDuration: 0.5) {
                self.imageTwo.frame.origin.x = 0
                self.imageOne.frame.origin.x = -self.view.frame.width
            }
        } else if imageOne.frame.origin.x == -view.frame.width {
            imageOne.frame.origin.x = view.frame.width
            imageOne.image = imgArr[nextPage]
            UIView.animate(withDuration: 0.5) {
                self.imageOne.frame.origin.x = 0
                self.imageTwo.frame.origin.x = -self.view.frame.width
            }
        } else if imageTwo.frame.origin.x == view.frame.width {
            imageTwo.image = imgArr[nextPage]
            UIView.animate(withDuration: 0.5) {
                self.imageTwo.frame.origin.x = 0
                self.imageOne.frame.origin.x = -self.view.frame.width
            }
        } else if imageOne.frame.origin.x == view.frame.width {
            imageOne.image = imgArr[nextPage]
            UIView.animate(withDuration: 0.5) {
                self.imageOne.frame.origin.x = 0
                self.imageTwo.frame.origin.x = -self.view.frame.width
            }
        }
    }
    
    
    @objc func processSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            swipeRight()
            uploadComments()
            checkLikeButton()
        case .left:
            swipeLeft()
            uploadComments()
            checkLikeButton()
        default:
            print("")
        }
       }
    
    @objc func handleKeyboardWillHide() {
        scrollView.contentInset = .zero
    }
    
    func checkLikeButton() {
        let imageName = "image\(currentPage + 1)"
        typealias like = pictures[imageName].like
        if like {
            likeButton.isSelected = true
        } else {
            likeButton.isSelected = false
        }
    }
    
    func uploadComments() {
        let imageName = "image\(currentPage + 1)"
        typealias comments = pictures[imageName].comments
        for comment in comments {
            if commentSectionTextView.text != "" {
                commentSectionTextView.text += comment
            } else {
                commentSectionTextView.text += """

                \(comment)
                """
            }
        }
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
         likeButton.isSelected = !likeButton.isSelected
        if likeButton.isSelected {
           let imageName = "image\(currentPage + 1)"
            pictures[imageName].like = true
        } else {
            pictures[imageName].like = false
        }
    }
    
    @IBAction func leaveCommentTextFieldEditingChanged(_ sender: Any) {
        let imageName = "image\(currentPage + 1)"
        typealias comments = pictures[imageName].comments
        comments.append(leaveCommentTextField.text)

    }
}


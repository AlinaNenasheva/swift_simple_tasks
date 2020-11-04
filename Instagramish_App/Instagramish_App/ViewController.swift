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
    typealias Pictures = [String : ImageProperties]
    var pictures = ["image1": ImageProperties(), "image2": ImageProperties(), "image3": ImageProperties(), "image4": ImageProperties()]
    var imgArr = [UIImage]()
    
    @IBOutlet weak var leaveCommentTextField: UITextField!
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for picture in pictures.keys {
            imgArr.append(UIImage(named: picture)!)
        }
        imageOne = UIImageView(frame: CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: likeButton.frame.origin.y - 150))
        imageTwo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: likeButton.frame.origin.y - 150))
        imageTwo.image = UIImage(named: "image1")
        imageOne.layer.cornerRadius = 10
        imageTwo.layer.cornerRadius = 10
        imageOne.setShadow()
        imageTwo.setShadow()
        imageOne.contentMode = .scaleToFill
        imageTwo.contentMode = .scaleToFill
        view.addSubview(imageOne)
        view.addSubview(imageTwo)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        leftSwipeGesture.direction = .left
        scrollView.addGestureRecognizer(leftSwipeGesture)

        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        rightSwipeGesture.direction = .right
        scrollView.addGestureRecognizer(rightSwipeGesture)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnContentView(_gesture:)))
        scrollView.addGestureRecognizer(tapGestureRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func handleTapOnContentView (_gesture: UITapGestureRecognizer){
        view.endEditing(true)
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
            clearCommentSection()
            uploadComments()
            checkLikeButton()
        case .left:
            swipeLeft()
            clearCommentSection()
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
        if pictures["image\(currentPage + 1)"]?.like ?? false {
            likeButton.isSelected = true
        } else {
            likeButton.isSelected = false
        }
    }
    
    func uploadComments() {
        if let comments = pictures["image\(currentPage + 1)"]?.comments {
        for comment in comments {
            if commentSectionTextView.text == "" {
                commentSectionTextView.text += comment
            } else {
                commentSectionTextView.text += "\n\n\(comment)"
            }
            }
        }
    }
    
    func clearCommentSection() {
        commentSectionTextView.text = ""
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        likeButton.isSelected = !likeButton.isSelected
        let imageName = "image\(currentPage + 1)"
        if likeButton.isSelected {
            pictures[imageName]!.like = true
        } else {
            pictures[imageName]!.like = false
        }
    }
    
    @IBAction func leaveCommentTextFieldEditDidEnd(_ sender: Any) {
        if leaveCommentTextField.text != "" {
            pictures["image\(currentPage + 1)"]?.comments.append(leaveCommentTextField.text!)
            clearCommentSection()
            uploadComments()
            leaveCommentTextField.text = ""
        }

    }
}


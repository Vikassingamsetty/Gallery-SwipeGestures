//
//  ViewController.swift
//  GalleryWithSwipeGestures
//
//  Created by Srans022019 on 13/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //var arrayValue = ["11.jpg","12.jpg", "13.jpg", "14.jpg"]
    var arrayValue = [UIImage(named: "11.jpg"),UIImage(named: "12.jpg"), UIImage(named: "13.jpg"), UIImage(named:"14.jpg")]
    
    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureRecogniser()
        
        imageView.image = arrayValue[0]
        
        //imageView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    
    func gestureRecogniser() {
     
        //right swipe
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(gestureRecogniser(gesture:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        
        //left swipe
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(gestureRecogniser(gesture:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
    }
    
    
    @objc func gestureRecogniser(gesture:UIGestureRecognizer) {
        
       
        
        if let gestureDirection = gesture as? UISwipeGestureRecognizer {
            
            switch gestureDirection.direction {
                
                //if needed to rotate in loop we can disable the comment below in code
                
            case UISwipeGestureRecognizer.Direction.right:
                print("swipped right == previous")
                
                if currentValue == 0 {
                    //currentValue = arrayValue.count - 1
                }else{
                    currentValue -= 1
                
                }
                
              //  imageView.image = UIImage(named: arrayValue[currentValue])
               imageView.image = arrayValue[currentValue]
                
                
            case UISwipeGestureRecognizer.Direction.left:
                print("swipped left = next")
                
                if currentValue == arrayValue.count - 1 {
                   // currentValue = 0
                    
                }else{
                    currentValue += 1
        
                }
                
               // imageView.image = UIImage(named: arrayValue[currentValue])
                imageView.image = arrayValue[currentValue]
                
            default:
                break
                
            }
            
        }
        
       
    }

}


//
//  SwipeVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 05.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {
    

    @IBOutlet weak var viewBeforeImage: UIView!
    @IBOutlet weak var image: UIImageView!
    
    var userImage : [UIImage] = []
    var indexOfImage : Int = 0
    @IBOutlet weak var indexOfPhotoLabel: UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print(#function)
        print("indexOfImage=\(indexOfImage)")
         image.image = userImage[indexOfImage]
         indexOfPhotoLabel.text = "\(indexOfImage+1)"
    }
    
    // MARK: UICollectionViewDataSource
    static func storyboardInstance() -> SwipeVC? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SwipeVC") as? SwipeVC
    }
    
    // MARK: - swipesAnimations
    
    
    
    var interactiveAnimator: UIViewPropertyAnimator!
    var interactiveAnimatorTopToBottom: UIViewPropertyAnimator!
    
    
    
    
    enum MyPanWay {
        case LeftToRight
        case RightToLeft
        case TopToBottom
        case BottomToTop
        case dafault
    }
    
    
    var myPanWay: MyPanWay = .dafault
    var prev: CGPoint = CGPoint(x: 0, y: 0)
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
    
        switch recognizer.state {
        case .began:
            
            var myDirection = self.image.frame.size.width
            let translation = recognizer.translation(in: self.view)
            if translation.x > 0 {
                myPanWay = .LeftToRight
                myDirection =  self.view.frame.size.width
            } else if translation.x < 0 {
                myPanWay = .RightToLeft
                myDirection = (0 - self.view.frame.size.width)
            }
            if translation.y > 0 {
                myPanWay = .TopToBottom
                myDirection =  self.view.frame.size.width
            }
            
            if myPanWay != .TopToBottom {
                interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                             curve: .easeInOut, animations: {
                                                                self.image.frame =
                                                                    self.image.frame.offsetBy(dx: myDirection, dy: 0)
                                                                self.image.alpha = 0
                                                                self.viewBeforeImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                                                                
                                                                
                                                                
                })
                interactiveAnimator.pauseAnimation()
                
            }
            
            if myPanWay == .TopToBottom {
                
                interactiveAnimatorTopToBottom = UIViewPropertyAnimator(duration: 0.5,
                                                                        curve: .easeInOut, animations: {
                                                                            self.image.frame =
                                                                            self.image.frame.offsetBy(dx: 0, dy: myDirection)
                                                       
                                                                            
                                                                            
                                                                            
                })
                interactiveAnimatorTopToBottom.pauseAnimation()
            }
            
            
            
            
        case .changed:
            
                let translation = recognizer.translation(in: self.view)
 
                if myPanWay == .LeftToRight {
                    interactiveAnimator.fractionComplete = translation.x / self.image.frame.size.width
                } else if  myPanWay == .RightToLeft {
                    let positive = -translation.x
                    interactiveAnimator.fractionComplete = positive / self.image.frame.size.width
                }
//                print("changed = \(interactiveAnimator.fractionComplete)   translation.x = \(translation.x)  image = \(self.image.frame.size.width)  ")
                if  myPanWay == .TopToBottom{
                    
                    interactiveAnimatorTopToBottom.fractionComplete = translation.y / self.image.frame.size.height
                }
               // print (interactiveAnimatorTopToBottom.fractionComplete)
            
                if myPanWay != .TopToBottom {
                    
                    if interactiveAnimator.fractionComplete > 0.50 {
                        //interactiveAnimator.stopAnimation(true)
                        //interactiveAnimator.fractionComplete = 1
                        interactiveAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                        if myPanWay == .RightToLeft {
                            if  indexOfImage < userImage.count - 1 {
                                indexOfImage += 1
                            } else {
                                indexOfImage = 0
                            }
                            // print("left index = \(indexOfImage)")
                            
                            returnAnimation()
                            changeImage()
                            // print("change")
                            recognizer.state = .ended
                            
                        }
                        
                        if myPanWay == .LeftToRight {
                            if indexOfImage > 0 {
                                indexOfImage -= 1
                            } else {
                                indexOfImage = userImage.count - 1
                            }
                            // print("right index = \(indexOfImage)")
                            
                            
                            returnAnimation()
                            changeImage()
                            //      print("change")
                            recognizer.state = .ended
                            
                        }
                    }
                }
            
            
                if myPanWay == .TopToBottom && interactiveAnimatorTopToBottom.fractionComplete > 0.35 {
                 
                    returnAnimationTop()
                    
                    //interactiveAnimatorTopToBottom.fractionComplete = 1
                    self.dismiss(animated: true, completion: nil)
                    
            }
            
            
        case .ended:
            
            
            if myPanWay != .TopToBottom {

                if interactiveAnimator.fractionComplete < 1  {
                    
                    returnAnimation()
                    
                }
                
                interactiveAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                
                
            }
            
            if myPanWay == .TopToBottom{
                if  interactiveAnimatorTopToBottom.fractionComplete < 1 {
                    
                    returnAnimationTop()
                }

                interactiveAnimatorTopToBottom.continueAnimation(withTimingParameters: nil, durationFactor: 0)

            }
                
            
            
  
            
            
        default: return
        }
    }
    
    private func returnAnimation() {
        interactiveAnimator.stopAnimation(true)

                  
                  interactiveAnimator.addAnimations {
                      self.image.frame = CGRect(x: self.image.layer.bounds.origin.x, y: self.image.layer.bounds.origin.y,   width: self.image.layer.bounds.width, height: self.image.layer.bounds.height)
                      self.image.alpha = 1
                    self.viewBeforeImage.transform = .identity
                  }
                  
                  interactiveAnimator.startAnimation()
    }
    
    private func returnAnimationTop() {
        interactiveAnimatorTopToBottom.stopAnimation(true)
                  
                  interactiveAnimatorTopToBottom.addAnimations {
                      self.image.frame = CGRect(x: 0, y: 0,   width: self.image.layer.bounds.width, height: self.image.layer.bounds.height)
                      self.image.alpha = 1
                    self.viewBeforeImage.transform = .identity
                  }
                  
                  interactiveAnimatorTopToBottom.startAnimation()
    }
    
    
    
    
    
    private func changeImage(){
        
        image.image = userImage[indexOfImage]
        indexOfPhotoLabel.text = "\(indexOfImage+1)"
        imageAnimate()
    }
    
    
    
    private func imageAnimate(){
        
        //print(myPanWay)
        
        let fromMove = myPanWay == .LeftToRight ? -image.layer.bounds.width : image.layer.bounds.width * 2
        let toMove = myPanWay == .LeftToRight ? image.layer.bounds.width / 1.2 : image.layer.bounds.width - image.layer.bounds.width / 1.2
        
        let toValue = image.layer.bounds
        let fromValue = CGRect(x: image.layer.bounds.origin.x, y: image.layer.bounds.origin.y,   width: image.layer.bounds.width/1.7, height: image.layer.bounds.height/1.7)
        

        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.5
        
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let move = CABasicAnimation(keyPath: "position.x")
        move.fromValue = fromMove
        move.toValue = toMove
        
        let translation = CABasicAnimation(keyPath: "bounds")
        translation.fromValue = fromValue
        translation.toValue = toValue
        
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.fromValue = 0
        alpha.toValue = 0.9
        
        animationsGroup.animations = [move, translation, alpha]
        
        
        image.layer.add(animationsGroup, forKey: nil)
        
        
    }
    
    
    
}

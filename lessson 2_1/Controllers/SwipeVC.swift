//
//  SwipeVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 05.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    var userImage : [UIImage] = []
    var indexOfImage : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // swipesObservers()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print(#function)
        print("indexOfImage=\(indexOfImage)")
        changeImage()
    }
    
    // MARK: UICollectionViewDataSource
    static func storyboardInstance() -> SwipeVC? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SwipeVC") as? SwipeVC
    }
    
    // MARK: swipesObservers
    
    
    var interactiveAnimator: UIViewPropertyAnimator!
    
    enum Panway{
        case Vertical
        case Horizontal
        case WasZeros
    }
    enum MyPanWay {
        case LeftToRight
        case RightToLeft
    }
    
    var panway:Panway = .Horizontal
    var myPanWay: MyPanWay = .LeftToRight
    var prev: CGPoint = CGPoint(x: 0, y: 0)
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        
        //let anchorPoint = recognizer.location(in: self.view)
        //print(anchorPoint.x)
        //print(self.image.frame)
        switch recognizer.state {
        case .began:
            
            //            let tr = recognizer.translation(in: self.view)
            //            if panway == .WasZeros {
            //
            //                       prev = tr
            //
            //                       if (tr.x==0 && tr.y==0)
            //                       {
            //                           panway = .WasZeros
            //                           return
            //                       }
            //
            //                       if (abs(tr.x)>abs(tr.y))
            //                       {
            //                           panway = .Horizontal
            //                       }
            //                       else
            //                       {
            //                           panway = .Vertical
            //                       }
            //                   }
            //                   if (panway == .Horizontal)  // your left-right function
            //                   {
            //                       var h = tr.x - prev.x
            //                       let sensitivity:CGFloat = 100.0
            //                       h = h / sensitivity
            //                       // adjust your left-right function, example
            //                       //print("Horizontal \(h)")
            //                       //someProperty = someProperty + h
            //                       if h > 0 {
            //                          //print("Left - Right \(h)")
            //                           self.myPanWay = .LeftToRight
            //                       } else {
            //                           //print("Right - Left \(h)")
            //                           self.myPanWay = .RightToLeft
            //                       }
            //
            //                   }
            //
            //                   if (panway == .Vertical)    // bigger/smaller
            //                   {
            //                       var v = tr.y - prev.y
            //                       let sensitivity:CGFloat = 2200.0
            //                       v = v / sensitivity
            //                       // adjust your up-down function, example
            //                       //print("Vertical")
            //                       //someOtherProperty = someOtherProperty + v
            //                   }
            //
            //                   prev = tr
            //
            //
            //
            //
            //
            //            print(myPanWay)
            //            var myDirection = myPanWay == .LeftToRight ? self.image.frame.size.width : (0 - self.image.frame.size.width)
            //            print(myDirection)
            var myDirection = self.image.frame.size.width
            let translation = recognizer.translation(in: self.view)
            if translation.x > 0 {
                myPanWay = .LeftToRight
                myDirection =  self.image.frame.size.width
            } else {
                myPanWay = .RightToLeft
                myDirection = (0 - self.image.frame.size.width)
            }
            
            
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         curve: .easeInOut, animations: {
                                                            self.image.frame =
                                                                self.image.frame.offsetBy(dx: myDirection, dy: 0)
                                                            self.image.alpha = 0
            })
            interactiveAnimator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.view)
            if myPanWay == .LeftToRight {
                interactiveAnimator.fractionComplete = translation.x / self.image.frame.size.width
            } else {
                let positive = -translation.x
                interactiveAnimator.fractionComplete = positive / self.image.frame.size.width
            }
            //print(interactiveAnimator.fractionComplete)
            
            if interactiveAnimator.fractionComplete > 0.65 {
                interactiveAnimator.fractionComplete = 1
                if myPanWay == .RightToLeft {
                    if  indexOfImage < userImage.count - 1 {
                        indexOfImage += 1
                    } else {
                        indexOfImage = 0
                    }
                    print("left index = \(indexOfImage)")
                    
                    interactiveAnimator.addAnimations {
                        self.image.frame = CGRect(x: 0, y: self.image.layer.bounds.origin.y,   width: self.image.layer.bounds.width, height: self.image.layer.bounds.height)
                    }
                     self.image.alpha = 1
                    interactiveAnimator.startAnimation()
                    changeImage()
                }
                
                if myPanWay == .LeftToRight {
                    if indexOfImage>0 {
                        indexOfImage -= 1
                    } else {
                        indexOfImage = userImage.count - 1
                    }
                    print("right index = \(indexOfImage)")
                    
                    interactiveAnimator.addAnimations {
                        self.image.frame = CGRect(x: 0, y: self.image.layer.bounds.origin.y,   width: self.image.layer.bounds.width, height: self.image.layer.bounds.height)
                    }
                     self.image.alpha = 1
                    interactiveAnimator.startAnimation()
                    changeImage()
                }
            }
            
        case .ended:
            
            print(interactiveAnimator.fractionComplete)
            if interactiveAnimator.fractionComplete < 1 {
                
                interactiveAnimator.stopAnimation(true)
         
                interactiveAnimator.addAnimations {
                    self.image.frame = CGRect(x: 0, y: self.image.layer.bounds.origin.y,   width: self.image.layer.bounds.width, height: self.image.layer.bounds.height)
                     self.image.alpha = 1
                }
                
                interactiveAnimator.startAnimation()
               
            }
            
            interactiveAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            
            
            
        default: return
        }
    }
    
    
    
    func swipesObservers(){
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer){
        
        switch gester.direction {
        case .right:
            
            imageAnimateRightBefore()
            
            if indexOfImage>0 {
                indexOfImage -= 1
            } else {
                indexOfImage = userImage.count - 1
            }
            print("right index = \(indexOfImage)")
            changeImage()
            
            
            
            
            
        case .left:
            
            imageAnimateLeftBefore()
            
            if  indexOfImage < userImage.count - 1 {
                indexOfImage += 1
            } else {
                indexOfImage = 0
            }
            print("left index = \(indexOfImage)")
            changeImage()
            
        default:
            break
        }
        
    }
    
    private func changeImage(){
        
        
        
        imageAnimate()
        
    }
    
    private func imageAnimateLeftBefore(){
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.5
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "position.x")
        translation.toValue = 0 - image.bounds.width
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.fromValue = 1
        alpha.toValue = 0
        
        animationsGroup.animations = [translation, alpha]
        
        image.layer.add(animationsGroup, forKey: nil)
        
        
        
        //changeImage()
    }
    
    private func imageAnimateRightBefore(){
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.5
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "position.x")
        translation.toValue = image.bounds.width * 2
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.fromValue = 1
        alpha.toValue = 0
        
        animationsGroup.animations = [translation, alpha]
        
        image.layer.add(animationsGroup, forKey: nil)
        
        
        //changeImage()
    }
    
    private func imageAnimate(){
        
        //image.alpha = 1
        
     
        
        let toValue = image.layer.bounds
        let fromValue = CGRect(x: image.layer.bounds.origin.x, y: image.layer.bounds.origin.y,   width: image.layer.bounds.width/2, height: image.layer.bounds.height/2)
        
        print("from = \(fromValue)")
             print("toValue = \(toValue)")
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.5
        
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "bounds")
        translation.fromValue = fromValue
        translation.toValue = toValue
        
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.fromValue = 0
        alpha.toValue = 0.5
        
        animationsGroup.animations = [translation, alpha]
        
        
        image.layer.add(animationsGroup, forKey: nil)
        image.image = userImage[indexOfImage]
        
        
        
        //image.layer.add(animationsGroup, forKey: nil)
        
        
        
        
        
    }
    
    
    
}

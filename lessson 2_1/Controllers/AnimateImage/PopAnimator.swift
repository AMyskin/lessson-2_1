//
//  PopAnimator.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 08.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit


class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let startImage: UICollectionViewCell?
    
    init(startImage: UICollectionViewCell){

        self.startImage = startImage
    }
    
    
    override init(){

        self.startImage = nil
    }
    
    let duration = 1.0
    var presenting = true
    var originFrame = CGRect.zero

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?)
        -> TimeInterval {
      return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to),
            let presentedVC = transitionContext.viewController(forKey: .to),
            let recipeView = presenting ? toView : transitionContext.view(forKey: .from) else {
                transitionContext.completeTransition(false)
                return
                
        }
        

        guard let startImage = startImage else {return}
        
        let imageFrame = startImage.convert(startImage.bounds, to: containerView)
       // let imageFrameCenter = CGPoint(x: imageFrame.midX, y: imageFrame.midY)

        let initialFrame = presenting ? imageFrame : recipeView.frame
        //let finalFrame = presenting ? recipeView.frame : originFrame
        let finalFrame = transitionContext.finalFrame(for: presentedVC)
        
        
        
        let xScaleFactor = presenting ?
          initialFrame.width / finalFrame.width :
          finalFrame.width / initialFrame.width

        let yScaleFactor = presenting ?
          initialFrame.height / finalFrame.height :
          finalFrame.height / initialFrame.height
        
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

        if presenting {
          recipeView.transform = scaleTransform
          recipeView.center = CGPoint(
            x: initialFrame.midX,
            y: initialFrame.midY)
          recipeView.clipsToBounds = true
        }

        recipeView.layer.cornerRadius = presenting ? 20.0 : 0.0
        recipeView.layer.masksToBounds = true
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(recipeView)

        UIView.animate(
          withDuration: duration,
          delay:0.0,
          usingSpringWithDamping: 0.5,
          initialSpringVelocity: 0.2,
          animations: {
            recipeView.transform = self.presenting ? .identity : scaleTransform
            recipeView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            recipeView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
          }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        
 

    }
    
    
    
}

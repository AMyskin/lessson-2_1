//
//  AnimationForSwipeVCToNew.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 08.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

extension SwipeVC: UIViewControllerTransitioningDelegate {
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return nil
    }

     
  
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return nil
    }
    
    
}

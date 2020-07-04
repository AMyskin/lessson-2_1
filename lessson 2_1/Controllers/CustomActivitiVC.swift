//
//  CustomActivitiVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 04.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class CustomActivitiVC: UIViewController {
    
    
    @IBOutlet weak var customAvtivityView: CustomActivitiIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        tapObserver()
        


     
    }
    override func viewWillAppear(_ animated: Bool) {
         
           customAvtivityView.startAnimate()
    }
    
    func tapObserver(){
        
 
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(singgleTapAction))

        self.view.addGestureRecognizer(tap)
    }
    
    @objc func singgleTapAction(){
        print(#function)
        passData()
    }
    
    
    @IBAction func passData() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let secondViewController = storyboard.instantiateViewController(identifier: "navigationController")
        secondViewController.modalPresentationStyle = .fullScreen
        //navigationController?.pushViewController(secondViewController, animated: true)
        self.present(secondViewController, animated: false, completion: nil)
           //show(secondViewController, sender: nil)
       }

    

}

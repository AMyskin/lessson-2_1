//
//  CharPicker.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 24.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit




class CharPicker: UIControl {

    // MARK: - Views
    
    var chars: [String] = User.sections
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func setup() {
        for char in chars {
            let button = UIButton(type: .system)
            button.setTitle(char, for: .normal)
            button.addTarget(self, action: #selector(selectChar(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        
        addSubview(stackView)
        
        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(panRecognizer))
        
        addGestureRecognizer(pan)
        
    }
    
    @objc func panRecognizer(recognizer: UIPanGestureRecognizer){
        print(#function)
    }
    
    @objc func selectChar(_ sender: UIButton) {
        guard
            let index = buttons.firstIndex(of: sender)
            
            else { return }
        
        let char = chars[index]
        
        print(char)
    }

 
    
}

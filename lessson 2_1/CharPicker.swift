//
//  CharPicker.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 24.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

enum MyChar: Int, CaseIterable {
    case А,В,Д,Я
    
    var title: String{
        switch self {
        case .А: return "А"
        case .В: return "B"
        case .Д: return "Д"
        case .Я: return "Я"
            
        }
    }
}


class CharPicker: UIControl {

    // MARK: - Views
    
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
        for char in MyChar.allCases {
            let button = UIButton(type: .system)
            button.setTitle(char.title, for: .normal)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        let tap = UIPanGestureRecognizer()
        tap.addTarget(self, action: #selector(panRecognizer))
        addGestureRecognizer(tap)
        
    }
    
    @objc func panRecognizer(recognizer: UIPanGestureRecognizer){
        print(#function)
    }
    
    @objc func selectDay(_ sender: UIButton) {
        guard
            let index = buttons.firstIndex(of: sender),
            let char = MyChar(rawValue: index)
            else { return }
        
        print(char.title)
    }

 
    
}

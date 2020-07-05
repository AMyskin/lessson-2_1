//
//  CustomSearchView.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 05.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

protocol CustomSearchViewDelegate: class {
    func CustomSearch(chars: String)
}

class CustomSearchView: UIView, UITextFieldDelegate {
    
    weak var delegate: CustomSearchViewDelegate?
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var searchButtonLabel: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchFieldText: UITextField!
    
    @IBAction func cancelButtonPushed(_ sender: UIButton) {
        print(self.searchButtonLabel.frame.origin.x)
        cancelButtonHide()
        moveBackSearchButtonLabel()
        moveBackSearchText()
        
        
    }
    
    
    
    @IBAction func searchText(_ sender: Any) {
        print(#function)
    }
    
    
    
    @IBAction func editDidBegin(_ sender: UITextField) {
        
        //print(self.searchButtonLabel.frame.origin.x)
        cancelButtonShow()
        moveSearchButtonLabel()
        moveSearchText()
        
        
    }
    
    private func moveSearchButtonLabel(){
        
        
        if self.searchButtonLabel.frame.origin.x > 0 {
            
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.searchButtonLabel.frame.origin.x -= (CGFloat(Int(self.bounds.width/2 - 20)))
            })
        }
    }
    private func moveSearchText(){
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.searchFieldText.frame.origin.x = 40
        })
    }
    private func moveBackSearchText(){
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.searchFieldText.frame.origin.x -= 40
        })
    }
    private func moveBackSearchButtonLabel(){
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.searchButtonLabel.frame.origin.x = (CGFloat(Int(self.bounds.width/2 - 20)))
        })
    }
    
    
    private func cancelButtonShow(){
        cancelButton.isHidden = false
        
        cancelButton.transform = CGAffineTransform(translationX: cancelButton.bounds.width, y: 0)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: 0)
            
        })
    }
    private func cancelButtonHide(){
        searchFieldText.text = ""
        searchFieldText.endEditing(true)
        
        cancelButton.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.cancelButton.transform = CGAffineTransform(translationX: self.cancelButton.bounds.width + 15, y: 0)
            
        })
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        
        
        
        // Этот метод для себя оставил чтобы не забыть, фукционала в данном случае тут нет
        Bundle.main.loadNibNamed("CustomSearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleHeight, .flexibleWidth]
        
        
        searchFieldText.placeholder = "Поиск"
        searchFieldText.text = ""
        
        searchFieldText.delegate = self
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        guard let text = textField.text else {return false}
        searchFieldText.endEditing(true)
        delegate?.CustomSearch(chars: text)
        return true
    }
    
    
    

    
    
    
    func textFieldDidChangeSelection(_ textField: UITextField){
        guard let text = textField.text else {return}
        delegate?.CustomSearch(chars: text)
    }
    
    
    
}

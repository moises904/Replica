//
//  Extension+UIBotton.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import UIKit

extension UIButton {
 
    func configureStyleButton() {
        self.setTitleColor(.black,for: UIControl.State.normal)
        self.titleLabel?.font = .boldSystemFont( ofSize: 20)
        self.layer.cornerRadius = 20
    }
    
}

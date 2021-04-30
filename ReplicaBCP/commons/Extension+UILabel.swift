//
//  TitleLabel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 25/04/21.
//

import UIKit

extension UILabel {
    
     func configureTitleLabel() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 20, weight:.bold)
        self.sizeToFit()
     }
    
    func configureTextOption() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 15, weight:.regular)
        self.sizeToFit()
    }
}

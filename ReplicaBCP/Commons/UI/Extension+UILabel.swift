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
    
    func configureDarkTitleLabel() {
        self.textColor = BcpCustomColors.BlueBcpPrimary
       self.font = .systemFont(ofSize: 20, weight:.bold)
       self.sizeToFit()
    }
    
    func configurePasswordLabel() {
        self.textColor = BcpCustomColors.BlueBcpPrimary
        self.font = .systemFont(ofSize: 25, weight:.bold)
        self.sizeToFit()
    }
    
    func configureTextOption() {
        self.textColor = .white
        self.numberOfLines = 2
        self.font = .systemFont(ofSize: 15, weight:.regular)
        self.textAlignment = .center
        self.sizeToFit()
    }
    
    func configureTextLink() {
        self.textColor = BcpCustomColors.OrangeBcpPrimary
        self.font = .systemFont(ofSize: 16, weight:.bold)
        self.textAlignment = .center
        self.sizeToFit()


    }
}

//
//  LoginViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var dataConfiguration: DataConfigurationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    public func setDataConfiguration(dataConfiguration: DataConfigurationModel) {
        self.dataConfiguration = dataConfiguration
        print(self.dataConfiguration?.typeGreats)
    }
}

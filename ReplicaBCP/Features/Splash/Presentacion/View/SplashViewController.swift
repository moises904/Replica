//
//  ViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initSplash()
    }
    
    private func initSplash() {
        Timer.scheduledTimer(timeInterval: 3, target: self,
                             selector: #selector(goToLogin), userInfo:nil, repeats: false)
        
    }

    @objc private func goToLogin() {
        
        let storyboard =  UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(identifier: "LoginStoryboardID")
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
    }

}


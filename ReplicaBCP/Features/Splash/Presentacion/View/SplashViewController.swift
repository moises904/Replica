//
//  ViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class SplashViewController: UIViewController, IBaseViewController {

    private let splashViewModel: SplashViewModel = SplashViewModel()
    private var dataConfigurationModel : DataConfigurationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObservers()
        callDataConfiguration()
    }
    
    private func initSplash(dataConfigurationModel: DataConfigurationModel?) {
        
        if (dataConfigurationModel != nil) {
        Timer.scheduledTimer(timeInterval: TimeInterval(dataConfigurationModel!.timeSplash),
                             target: self,
                             selector: #selector(goToLogin), userInfo:nil, repeats: false)
        }
        
    }

    @objc private func goToLogin() {
        let storyboard =  UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(identifier: "LoginStoryboardID")
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
    }
    
    private func callDataConfiguration() {
        splashViewModel.getDataConfigInitial()
        
    }
    
    func registerObservers() {
    
        self.splashViewModel.dataConfigurationLiveData?.observe {
            configuration in
            if( configuration.timeSplash > 0) {
                self.dataConfigurationModel = configuration
                self.initSplash(dataConfigurationModel: self.dataConfigurationModel)
            }
            
        }
        

    }

}


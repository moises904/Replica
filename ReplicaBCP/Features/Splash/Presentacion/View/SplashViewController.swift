//
//  ViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit
import Lottie

class SplashViewController: UIViewController, IBaseViewController {

    @IBOutlet weak var animationSplash: AnimationView!
    private let splashViewModel: SplashViewModel = SplashViewModel()
    private var dataConfigurationModel : DataConfigurationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        registerObservers()
        callDataConfiguration()
    }
    
    private func initializeView() {
        self.view.backgroundColor = BcpColors.BlueBcpPrimary
        loadAnimation()
        hideNavigationBar()
    }
    
    private func loadAnimation() {
        animationSplash?.contentMode = .scaleAspectFill
        let pathAnimation = Bundle.main.path(forResource: "splash_logo", ofType: "json")
        let animation = Animation.filepath(pathAnimation ?? "")
        animationSplash?.backgroundColor = BcpColors.BlueBcpPrimary
        animationSplash?.animation = animation
        animationSplash?.loopMode = .loop
        animationSplash?.animationSpeed = 0.5
        animationSplash?.play()
    }
    
    
    
    private func initSplash(dataConfigurationModel: DataConfigurationModel?) {
        
        if (dataConfigurationModel != nil) {
        Timer.scheduledTimer(timeInterval: TimeInterval(dataConfigurationModel!.timeSplash),
                             target: self,
                             selector: #selector(goToLogin), userInfo:nil, repeats: false)
        }
        
    }

    @objc private func goToLogin() {
        
        self.animationSplash?.stop()
        
        let storyboard =  UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(identifier: "LoginStoryboardID") as? LoginViewController
        loginViewController?.setDataConfiguration(dataConfiguration: self.dataConfigurationModel!)
        self.navigationController?.pushViewController((loginViewController!), animated: true)
        
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

    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}


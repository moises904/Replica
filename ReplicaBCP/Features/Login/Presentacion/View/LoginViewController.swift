//
//  LoginViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblTitleGreats: UILabel!
    
    @IBOutlet var view1: UIView!
    var dataConfiguration: DataConfigurationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationView()
        loadDataConfiguration()
    }
    
    private func initializationView() {
        self.lblTitleGreats.configureTitleLabel()
        self.view1.backgroundColor = BcpColors.BlueBcpPrimary
    }
    
    public func setDataConfiguration(dataConfiguration: DataConfigurationModel) {
        self.dataConfiguration = dataConfiguration
    }
    
    private func loadDataConfiguration() {
        self.lblTitleGreats?.text = self.dataConfiguration?.typeGreats

    }
}

//
//  HomeViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class HomeViewController: UIViewController {
 
    @IBOutlet weak var welcomeUserLabel: UILabel!
    @IBOutlet var view1: UIView!
    
    private var dataUser:LoginModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func setDataLoginUser(dataUser: LoginModel) {
        self.dataUser = dataUser
    }
    
    func initializeView() {
        
        if (self.dataUser != nil) {
            self.welcomeUserLabel.configureDarkTitleLabel()
            self.welcomeUserLabel.numberOfLines = 2
            self.welcomeUserLabel.text = self.dataUser!.userName + "\n" + self.dataUser!.lastName
        }
    }
}

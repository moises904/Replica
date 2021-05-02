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
    var completionHandler:(()->LoginModel)?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        self.dataUser = (self.completionHandler!())
        if (self.dataUser != nil) {
            self.welcomeUserLabel.configureDarkTitleLabel()
            self.welcomeUserLabel.numberOfLines = 2
            self.welcomeUserLabel.text = self.dataUser!.userName + "\n" + self.dataUser!.lastName
        }
    }
}

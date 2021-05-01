//
//  LoginViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit
import Lottie

protocol ComunicationViewController {
    func eventToViewController(dataUser: LoginModel)
}

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,                                            ComunicationViewController {
    
    
    @IBOutlet weak var greattingAnimationView: AnimationView!
    @IBOutlet weak var lblTitleGreats: UILabel!
    @IBOutlet var view1: UIView!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    private let namesOptions = [0: "Transferir\ndinero", 1: "Ingresar", 2: "Ubícanos",
                                      3: "Token Digital", 4 : "Bloqueo\nde tarjeta", 5: "Para ti"]
    private let imagesOptions = [0:"transfer.png",1:"ingresos.png",2:"map.png",
                                 3:"chip.png",4:"candado.png",5:"regalo.png"]
    private var pivote = 0
    var dataConfiguration: DataConfigurationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationView()
        animationStart()
        loadDataConfiguration()
    }
    
    private func initializationView() {
        self.lblTitleGreats.configureTitleLabel()
        self.view1.backgroundColor = BcpColors.BlueBcpPrimary
        self.optionsCollectionView.backgroundColor = BcpColors.BlueBcpPrimary
        self.optionsCollectionView.delegate = self
        self.optionsCollectionView.dataSource = self
    }
    
    private func animationStart() {
        greattingAnimationView?.contentMode = .scaleAspectFill
        let pathAnimation = Bundle.main.path(forResource: "content", ofType: "json")
        let animation = Animation.filepath(pathAnimation ?? "")
        greattingAnimationView?.backgroundColor = BcpColors.BlueBcpPrimary
        greattingAnimationView?.animation = animation
        greattingAnimationView?.loopMode = .loop
        greattingAnimationView?.animationSpeed = 0.5
        greattingAnimationView?.play()
    }
    
    public func setDataConfiguration(dataConfiguration: DataConfigurationModel) {
        self.dataConfiguration = dataConfiguration
    }
    
    private func loadDataConfiguration() {
        self.lblTitleGreats?.text = self.dataConfiguration?.typeGreats

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOption", for: indexPath as IndexPath) as!OptionCollectionViewCell
        if (pivote < indexPath.section) {
            pivote = (indexPath.section + 1)
        }
        
        cell.descriptionLabel.text = self.namesOptions[pivote + indexPath.section + indexPath.row]
        cell.descriptionLabel.configureTextOption()
        cell.iconImageView.frame.size.height = 70
        cell.iconImageView.frame.size.width =  90
        cell.iconImageView.contentMode = .scaleAspectFit
        cell.iconImageView.image = UIImage(named: self.imagesOptions[pivote + indexPath.section + indexPath.row]!)
        cell.iconImageView.tintColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if( indexPath.section == 0 && indexPath.row == 1) {
            goToKeyboard()
        }
        return true
    }
    
    private func goToKeyboard() {
        let storyboard =  UIStoryboard(name: "Keyboard", bundle: nil)
        let keyboardViewController = storyboard.instantiateViewController(identifier:"KeyboardViewControllerID") as? KeyboardViewController
        keyboardViewController?.comunicatiorViewController(comunication: self)
        keyboardViewController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(keyboardViewController!, animated: true, completion: nil)
        
    }
    
    private func goToHome(dataUser: LoginModel) {
        let storyboard =  UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(identifier:"HomeStoryboardID") as? HomeViewController
        homeViewController?.setDataLoginUser(dataUser: dataUser)
        self.navigationController?.pushViewController(homeViewController!, animated: true)
        
    }
    
    func eventToViewController(dataUser: LoginModel) {
        if ( dataUser.userName.count > 0) {
            goToHome(dataUser: dataUser)
        }
    }
   
}

//
//  LoginViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var lblTitleGreats: UILabel!
    @IBOutlet var view1: UIView!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    private let namesOptions = [0: "Transferir\ndinero", 1: "Ingresar", 2: "Ubícanos",
                                      3: "Token Digital", 4 : "Bloqueo\nde tarjeta", 5: "Para ti"]
    private let imagesOptions = [0:"ico_ubicacion.png",1:"ico_ubicacion.png",2:"ico_ubicacion.png",
                                 3:"ico_ubicacion.png",4:"ico_ubicacion.png",5:"ico_ubicacion.png"]
    private var pivote = 0
    var dataConfiguration: DataConfigurationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationView()
        loadDataConfiguration()
    }
    
    private func initializationView() {
        self.lblTitleGreats.configureTitleLabel()
        self.view1.backgroundColor = BcpColors.BlueBcpPrimary
        self.optionsCollectionView.backgroundColor = BcpColors.BlueBcpPrimary
        self.optionsCollectionView.delegate = self
        self.optionsCollectionView.dataSource = self
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
        keyboardViewController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(keyboardViewController!, animated: true, completion: nil)
        
    }
}

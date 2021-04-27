//
//  LoginViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 22/04/21.
//

import UIKit

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var lblTitleGreats: UILabel!
    @IBOutlet var view1: UIView!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    
    var dataConfiguration: DataConfigurationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationView()
        loadDataConfiguration()
    }
    
    private func initializationView() {
        self.lblTitleGreats.configureTitleLabel()
        self.view1.backgroundColor = BcpColors.BlueBcpPrimary
        self.optionsCollectionView.backgroundColor = .white
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOption", for: indexPath) as!OptionCollectionViewCell
        cell.descriptionLabel.text = "hola"
        cell.iconImageView.frame.size.height = 100
        cell.iconImageView.frame.size.width = 100
        cell.iconImageView.contentMode = .scaleAspectFit
        cell.iconImageView.image = UIImage(named: "ico_ubicacion.png")
        return cell
    }
}

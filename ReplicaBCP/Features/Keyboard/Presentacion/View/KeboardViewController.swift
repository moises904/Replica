//
//  KeboardViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 29/04/21.
//

import UIKit

class KeyboardViewController : UIViewController, UICollectionViewDelegate,
                               UICollectionViewDataSource, IBaseViewController, Alertable {

    
    @IBOutlet weak var passwordHideLabel: UILabel!
    @IBOutlet weak var forgetPassword: UILabel!
    @IBOutlet weak var keyboardCollectionView: UICollectionView!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var labelPasswordLabel: UILabel!
    
    private let keyboardViewModel: KeyboardViewModel = KeyboardViewModel()
    private var keyboardModel: KeyboardModel = KeyboardModel()
    private var pivote:Int = 0
    private let DIGITS_PASSWROD = 6
    private var positionsForPassword: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        registerObservers()
        callGetKeyboard()
    }

    private func callGetKeyboard() {
        self.keyboardViewModel.getDigitsKeyboard()
    }
    
    
    private func initializeView() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.closeImageView.addGestureRecognizer(tap)
        self.keyboardCollectionView.delegate = self
        self.keyboardCollectionView.dataSource = self
        self.forgetPassword.configureTextLink()
        self.passwordHideLabel.configurePasswordLabel()
    }
 
    @objc private func closeKeyboard() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellKeyboard",
                                                      for: indexPath as IndexPath) as!KeyboatdCollectionViewCell
        cell.numberButton.configureStyleButton()
        cell.numberButton.addTarget(self, action: #selector(setDigitPassword(_:)), for: .touchUpInside)
        // send position to server
        cell.numberButton.tag = pivote

        let digit = String(self.keyboardModel.table[pivote])
        pivote = pivote + 1
        cell.numberButton.setTitle(digit,
                                   for: UIControl.State.normal)
            if(digit != "-1") {
                cell.numberButton.setTitle(digit,
                                           for: UIControl.State.normal)
            } else {
                cell.numberButton.isHidden = true
            }
        
        return cell
    }
    
    @objc func setDigitPassword(_ sender : UIButton) {
        
        if (self.labelPasswordLabel.text!.count < DIGITS_PASSWROD) {
            self.labelPasswordLabel!.text! = self.labelPasswordLabel!.text! + "*"
            self.positionsForPassword = self.positionsForPassword + String(sender.tag)
            print(sender.tag)
        }
        
        if(self.labelPasswordLabel.text!.count == DIGITS_PASSWROD) {
            self.keyboardViewModel.getLoginUser(positionsPassword: self.positionsForPassword)
        }
        
    }
    
    func registerObservers() {
        
        self.keyboardViewModel.keyboardModelLiveData?.observe {
            resultKeyboard in
            self.keyboardModel = resultKeyboard
        }
        
        self.keyboardViewModel.errorLoginLiveData.observe {
            resultErrorLogin in
            self.showAlert(message: resultErrorLogin)
        }
        
        self.keyboardViewModel.successLoginLiveData.observe {
            resultSuccessLogin in
            let welcomeUser = "Bienvenido " + resultSuccessLogin.userName + " , " + resultSuccessLogin.lastName
            self.showAlert(message: welcomeUser)
            //self.dismiss(animated: true, completion:nil)

        }
    }
}

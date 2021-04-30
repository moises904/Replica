//
//  KeboardViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 29/04/21.
//

import UIKit

class KeyboardViewController : UIViewController, UICollectionViewDelegate,
                               UICollectionViewDataSource, IBaseViewController {

    
    @IBOutlet weak var keyboardCollectionView: UICollectionView!
    @IBOutlet weak var closeImageView: UIImageView!
    
    private let keyboardViewModel: KeyboardViewModel = KeyboardViewModel()
    private var keyboardModel: KeyboardModel = KeyboardModel()
    private var pivote:Int = 0
    
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
        
        if (pivote < indexPath.section) {
            pivote = pivote + (indexPath.section + 1)
        }
        
        let digit = String(self.keyboardModel.table[pivote + indexPath.section + indexPath.row])
            if(digit != "-1") {
                cell.numberButton.setTitle(digit,
                                           for: UIControl.State.normal)
            } else {
            cell.numberButton.isHidden = true
            }
        
        return cell
    }
    
    func registerObservers() {
        self.keyboardViewModel.keyboardModelLiveData?.observe {
            result in
            self.keyboardModel = result
        }
    }
}

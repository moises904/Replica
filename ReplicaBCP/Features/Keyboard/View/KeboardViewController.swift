//
//  KeboardViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 29/04/21.
//

import UIKit

class KeyboardViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var keyboardCollectionView: UICollectionView!
    @IBOutlet weak var closeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
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
        cell.numberButton.setTitle("9", for: UIControl.State.normal)
        
        
        return cell
    }
    
}

//
//  BaseViewController.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 25/04/21.
//

import UIKit

@objc protocol IBaseViewController {
    @objc optional func hideNavigationBar()
    func registerObservers()
}

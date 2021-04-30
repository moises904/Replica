//
//  LoginModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

struct LoginModel: DataLoginModel {
    
    var userName: String
    var lastName: String
    
}

protocol DataLoginModel {
    var userName: String { get set }
    var lastName: String { get set}
}

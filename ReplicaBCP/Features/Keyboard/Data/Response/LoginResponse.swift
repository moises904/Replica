//
//  LoginResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

struct LoginResponse: BaseResponse, Decodable {
    
    let code: Int
    let user: User
    
}

struct User: Decodable {
    let name: String
    let lastName: String
}

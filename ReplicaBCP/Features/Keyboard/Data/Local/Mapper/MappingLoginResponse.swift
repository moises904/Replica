//
//  MappingLoginResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

func transformLoginResponse(loginResponse: LoginResponse) -> LoginModel {
    return LoginModel(userName: loginResponse.user.name, lastName: loginResponse.user.lastName)
}


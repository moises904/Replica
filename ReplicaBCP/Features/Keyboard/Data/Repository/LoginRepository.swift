//
//  LoginRepository.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class LoginRepository: ILoginRepository {
    
    func LoginUser(modeOperation: ModeOperation, password: String,
                   completion: @escaping (Result<LoginModel?, Error>) -> Void) {
        //Aqui se llamara a la API remote
    }
    
    
}

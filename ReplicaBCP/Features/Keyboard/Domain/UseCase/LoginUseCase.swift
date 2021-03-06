//
//  LoginUseCase.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

protocol ILoginUseCase {
    func execute(password:String,
                 completion: @escaping(_ response:Result<LoginModel?, Error>) -> Void)
}

class LoginUseCase: ILoginUseCase {
    
    private let loginProxy: LoginProxy
    
    init(loginProxy:LoginProxy = LoginProxy()) {
        self.loginProxy = loginProxy
    }
    
    func execute(password:String, completion: @escaping (Result<LoginModel?, Error>) -> Void) {
        self.loginProxy.LoginUser(modeOperation: .mockServices, password: password, completion: completion)
    }
    
    
}

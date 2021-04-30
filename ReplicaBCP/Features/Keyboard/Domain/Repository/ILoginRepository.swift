//
//  ILoginRepository.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

protocol ILoginRepository {
    func LoginUser(modeOperation: ModeOperation,
                   completion: @escaping(_ response:Result<LoginModel?, Error>)->Void)
}

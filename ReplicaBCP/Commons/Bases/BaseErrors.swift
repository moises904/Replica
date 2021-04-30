//
//  BaseErrors.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

enum LoginError: Error {
    case invalidUser
    case invalidPassword
    case unknowError
}


extension LoginError: LocalizedError {
    public var errorDescription: String? {
        
        switch self {
        case .invalidPassword:
            return "El password no es correcto."
        
        case .invalidUser:
            return "El usuario no es correcto."

        case .unknowError:
            return "Ocurrió un error desconocido."

        }
    }
}

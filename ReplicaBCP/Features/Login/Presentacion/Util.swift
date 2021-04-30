//
//  Util.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 29/04/21.
//

import Foundation

enum options {
    
    case transfer
    case login
    case locations
    case tokenDigital
    case blockCard
    case forYou
    
    var optionIdentifier: String {
        
        switch self {
        
        case .transfer:
            return "Tranferir dinero"
        
        case .login:
            return "Ingresar"
        case .locations:
            return "Ubícanos"
        case .tokenDigital:
            return "Token Digital"
        case .blockCard:
            return "Bloqueo de tarjeta"
        case .forYou:
            return "Para ti"
        }
        
    }
    
}

//
//  KeyboardRepository.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class KeyboardRepository:IGetKeyboardRepository {
    func getRandomKeyboard(modeOperation: ModeOperation,
                           completion: @escaping (Result<KeyboardModel?, Error>) -> Void) {
        //Aqui se llama a la API - Remote
    }
    
    
}

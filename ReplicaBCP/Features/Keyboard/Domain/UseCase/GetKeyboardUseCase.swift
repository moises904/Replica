//
//  GetKeyboardUseCase.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

protocol IGetKeyboardUseCase {
    func execute(completion: @escaping(_ response:Result<KeyboardModel?, Error>) -> Void)
}

class GetKeyboardUseCase: IGetKeyboardUseCase {
    
    private let keyboardProxy: KeyboardProxy
    
    init(keyboardProxy : KeyboardProxy = KeyboardProxy()) {
        self.keyboardProxy = keyboardProxy
    }
    
    func execute(completion: @escaping (Result<KeyboardModel?, Error>) -> Void) {
        self.keyboardProxy.getRandomKeyboard(modeOperation:.mockServices, completion: completion)
    }
    
}

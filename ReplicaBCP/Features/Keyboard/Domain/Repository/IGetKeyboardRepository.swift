//
//  IGetKeyboardRepository.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

protocol IGetKeyboardRepository {
    func getRandomKeyboard(modeOperation: ModeOperation,
                           completion: @escaping(_ response:Result<KeyboardModel?, Error>)->Void)
}

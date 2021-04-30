//
//  KeyboardProxy.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class KeyboardProxy: IGetKeyboardRepository {
    
    private let keyboardRespository: KeyboardRepository?
    
    init() {
        self.keyboardRespository = KeyboardRepository()
    }
    
    func getRandomKeyboard(modeOperation: ModeOperation,
                           completion: @escaping (Result<KeyboardModel?, Error>) -> Void) {
       
        if(modeOperation == .realServices) {
            print("Llamando al servicio keybaord real")
        } else {
            print("Llamando al servicio keybaord mock")

            do {
                let keyboardData =  try getKeyboardOnMockService()
                completion(.success(keyboardData))

            } catch {
                print("No se pudo cargar el mock -> \(error)")

            }
        }
    }
    
    private func getKeyboardOnMockService() throws -> KeyboardModel?{
        print("Ejecuntando llamada a servicio keyboard mock")
        let keyboardResponse = try ReaderLocalJson.readerLocalData(nameFile:"KeyboardResponse")
        let jsonKeyboard = try JSONDecoder().decode(KeyboardResponse.self, from: keyboardResponse!)
        
        if(jsonKeyboard.code == 200) {
            let dataConfig = transformKeyboard(keyboardResponse:jsonKeyboard)
            return dataConfig
        }
        return nil
    }

    
}

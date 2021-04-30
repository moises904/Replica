//
//  LoginProxy.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class LoginProxy: ILoginRepository {
    
    
    
    
    func LoginUser(modeOperation: ModeOperation, completion: @escaping (Result<LoginModel?, Error>) -> Void) {
    
        if( modeOperation == .realServices ) {
            getLoginOnRealService()
        } else {
            
            do {
                let loginModel =  try getLoginOnMockService ()
                completion(.success(loginModel))
            } catch {
                print("No se pudo cargar el mock -> \(error)")

            }
            
        }
        
    }
    
    private func getLoginOnMockService() throws -> LoginModel?{
        print("Ejecuntando llamada a servicio Login mock")
        let loginResponse = try ReaderLocalJson.readerLocalData(nameFile:"LoginResponse")
        let jsonLogin = try JSONDecoder().decode(LoginResponse.self, from: loginResponse!)
        
        if(jsonLogin.code == 200) {
            print("Login 200")
           // let dataConfig = transformKeyboard(keyboardResponse:jsonKeyboard)
           // return dataConfig
        }
        return nil
    }

    private func getLoginOnRealService()  -> LoginModel? {
        return nil
    }
    
    
    
}

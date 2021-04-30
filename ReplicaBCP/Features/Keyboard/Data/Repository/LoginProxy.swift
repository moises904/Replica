//
//  LoginProxy.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class LoginProxy: ILoginRepository {
    
    private let PASSWORD_MOCK = "888888"
    
    func LoginUser(modeOperation: ModeOperation, password:String, completion: @escaping (Result<LoginModel?, Error>) -> Void) {
    
        if( modeOperation == .realServices ) {
            _ = getLoginOnRealService()
        } else {
            
            do {
                let loginModel =  try getLoginOnMockService (password:password)
                completion(.success(loginModel))
            } catch (let error) {
                completion(.failure(error))
                            
            } catch {
                print("No se pudo cargar el mock -> \(error)")
                completion(.failure(LoginError.unknowError))
            }
            
        }
        
    }
    
    private func getLoginOnMockService(password:String) throws -> LoginModel?{
        print("Ejecuntando llamada a servicio Login mock")
        
        if (password == PASSWORD_MOCK) {
            
        let loginResponse = try ReaderLocalJson.readerLocalData(nameFile:"LoginResponse")
        let jsonLogin = try JSONDecoder().decode(LoginResponse.self, from: loginResponse!)
        
            if(jsonLogin.code == 200) {
                let dataLogin = transformLoginResponse(loginResponse:jsonLogin)
                return dataLogin
            }
            
        } else {
            throw LoginError.invalidPassword
            
        }
        
        
        return nil
    }

    private func getLoginOnRealService()  -> LoginModel? {
        return nil
    }
    
    
    
}

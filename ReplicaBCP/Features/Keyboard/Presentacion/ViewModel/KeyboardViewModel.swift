//
//  KeyboardViewModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class KeyboardViewModel {
    
    var keyboardModelLiveData: LiveData<KeyboardModel>?
    var errorLoginLiveData: LiveData<String>
    var successLoginLiveData: LiveData<LoginModel>
    
    private let keyboardUseCase: GetKeyboardUseCase
    private let loginUseCase: LoginUseCase
    
    init() {
        
        self.keyboardUseCase = GetKeyboardUseCase()
        self.loginUseCase = LoginUseCase()
        
        self.keyboardModelLiveData = LiveData<KeyboardModel> (_value: KeyboardModel())
        self.errorLoginLiveData = LiveData<String>(_value: "")
        self.successLoginLiveData = LiveData<LoginModel> (_value: LoginModel(userName: "", lastName: ""))
        
    }
    
    public func getDigitsKeyboard() {
        
    let dataCompletion: ((Result<KeyboardModel?, Error>)->Void) = {
        result in
        
        switch result {
        case .success(let keyboardModel):
            print("success keyboard on view model")
            self.keyboardModelLiveData?.value = keyboardModel!
            break
        default:
            print("nada")
        }
            
    }
        keyboardUseCase.execute(completion: dataCompletion)
    }
    
    func getLoginUser(positionsPassword: String) {
        
        let loginComplete: ((Result<LoginModel?, Error>)->Void) = {
            
            result in
            
            switch result {
            case .success(let loginModel):
                self.successLoginLiveData.value = loginModel!
                break
                
            case .failure(let error as LoginError):
                print(error)
                self.errorLoginLiveData.value = error.errorDescription!
                break
                
            default:
                print("nada")
                
            }
            
        }
        loginUseCase.execute(password: positionsPassword,completion: loginComplete)
    }
}

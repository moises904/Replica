//
//  KeyboardViewModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class KeyboardViewModel {
    
    private let keyboardUseCase: GetKeyboardUseCase
    private let loginUseCase: LoginUseCase
    var keyboardModelLiveData: LiveData<KeyboardModel>?
    
    init() {
        self.keyboardUseCase = GetKeyboardUseCase()
        self.loginUseCase = LoginUseCase()
        
        self.keyboardModelLiveData = LiveData<KeyboardModel> (_value: KeyboardModel())
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
            print("\(positionsPassword)")
        let loginComplete: ((Result<LoginModel?, Error>)->Void) = {
            result in
            
            switch result {
            case .success(let loginModel):
                print("success loginModel on view model")
                //self.keyboardModelLiveData?.value = loginModel!
                break
            default:
                print("nada")
            }
            
        }
        loginUseCase.execute(completion: loginComplete)
    }
}

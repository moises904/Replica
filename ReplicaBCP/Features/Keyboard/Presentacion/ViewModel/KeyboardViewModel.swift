//
//  KeyboardViewModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

class KeyboardViewModel {
    
    private let keyboardUseCase: GetKeyboardUseCase
    var keyboardModelLiveData: LiveData<KeyboardModel>?
    
    init() {
        self.keyboardUseCase = GetKeyboardUseCase()
        self.keyboardModelLiveData = LiveData<KeyboardModel> (_value: KeyboardModel())
    }
    
    public func getDigitsKeyboard() {
        
    let dataCompletion: ((Result<KeyboardModel?, Error>)->Void) = {
        result in
        
        switch result {
        case .success(let keyboardModel):
            print("success keyboard on view model")
            print(keyboardModel)
            self.keyboardModelLiveData?.value = keyboardModel!
            break
        default:
            print("nada")
        }
            
    }
        keyboardUseCase.execute(completion: dataCompletion)
    }
}

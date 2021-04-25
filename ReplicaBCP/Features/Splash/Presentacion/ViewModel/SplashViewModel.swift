//
//  SplashViewModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

class SplashViewModel {
    
    
    private let getDataInitialUseCase: GetDataInitialUseCase
    var dataConfigurationLiveData: LiveData<DataConfigurationModel>?
    
    
    init() {
        self.getDataInitialUseCase = GetDataInitialUseCase()
        self.dataConfigurationLiveData = LiveData<DataConfigurationModel> (_value: DataConfigurationModel())
    }
    
    func getDataConfigInitial() {
        
        
        let dataConfigCompletion : ((Result<DataConfigurationModel?, Error>)-> Void) = {
            
            result in
            
            switch result {
            case .success(let configuraionSplash):
                print("success on view model")
                 self.dataConfigurationLiveData?.value = configuraionSplash!
                break
            default:
                print("nada")
            }
            
        }
        
        self.getDataInitialUseCase.execute(completion:dataConfigCompletion)
        
    }
}

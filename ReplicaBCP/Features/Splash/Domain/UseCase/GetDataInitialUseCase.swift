//
//  GetDataInitialUseCase.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

protocol IGetDataInitialUseCase {
    func execute(completion: @escaping(_ response:Result<DataConfigurationModel?, Error>) -> Void)
}

class GetDataInitialUseCase: IGetDataInitialUseCase {
    
    private let dataInitialProxy: DataInitialProxy

    init(dataInitial : DataInitialProxy = DataInitialProxy()) {
        self.dataInitialProxy = dataInitial
    }
    
    func execute(completion: @escaping(_ response:Result<DataConfigurationModel?, Error>) -> Void) {
         dataInitialProxy.getDataInitial(modeOperation: .mockServices, completion: completion)
    }
    
}

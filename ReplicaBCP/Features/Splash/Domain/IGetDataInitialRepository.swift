//
//  IGetDataInitial.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

protocol IGetDataInitialRepository {
    
    func getDataInitial(modeOperation: ModeOperation,
                        completion: @escaping(_ response:Result<DataConfigurationModel?, Error>) -> Void)
    
}

//
//  DataInitialRepository.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

class DataInitialRepository: IGetDataInitialRepository {
    func getDataInitial(modeOperation: ModeOperation,
                        completion: @escaping (Result<DataConfigurationModel?, Error>) -> Void) {
        //Aqui se llama a la API Remote
    }
    
}

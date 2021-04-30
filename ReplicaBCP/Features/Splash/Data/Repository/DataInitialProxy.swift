//
//  DataInitialProxy.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

enum ModeOperation {
    case mockServices
    case realServices
}

class DataInitialProxy : IGetDataInitialRepository {
    
    private let dataInitialRespository: DataInitialRepository?
    
    init() {
        self.dataInitialRespository = DataInitialRepository()
    }
    
    func getDataInitial(modeOperation: ModeOperation,
                        completion: @escaping(_ response:Result<DataConfigurationModel?, Error>) -> Void) {
        
        if(modeOperation == .realServices) {
            getDataInitialOnRealService()
        
        } else {
            
            do {
                
                let dataConfiguration =  try getDataInitialOnMockService()
                completion(.success(dataConfiguration))
            } catch {
                print("No se pudo cargar el mock -> \(error)")
            }
        }
    }
    
    private func getDataInitialOnRealService() {
        print("Ejecutando llamada a servicio real")
    }
    
    private func getDataInitialOnMockService() throws -> DataConfigurationModel?{
        print("Ejecuntando llamada a servicio mock")
        let dataResponse = try ReaderLocalJson.readerLocalData(nameFile:"DataInitialResponse")
        
        let jsonDataInitial = try JSONDecoder().decode(DataInitialResponse.self, from: dataResponse!)
        
        if(jsonDataInitial.codeResponse == 200) {
                let dataConfig = transformDataConfigResponseToDataConfigModel(dataConfigurationResponse:                    jsonDataInitial.dataResponse)
            return dataConfig
        }
        return nil
    }
    
}

//
//  MappingResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 24/04/21.
//

import Foundation


enum turnGreatd {
    case dia
    case noche
}

func transformDataConfigResponseToDataConfigModel(dataConfigurationResponse: DataConfiguration?) -> DataConfigurationModel? {
    
    var dataInitialModel: DataConfigurationModel
    let timeToGread:String
    
    guard dataConfigurationResponse == nil else {

        if dataConfigurationResponse?.time == 1 {
           timeToGread = "Buenos dias"
        } else{
           timeToGread = "Buenas noches"
        }
        
        dataInitialModel = DataConfigurationModel()
        dataInitialModel.timeSplash = dataConfigurationResponse?.time ?? 0
        dataInitialModel.typeGreats = timeToGread
        dataInitialModel.enableSound = dataConfigurationResponse?.sounds ?? false
        return dataInitialModel
    }
    
    return nil
}

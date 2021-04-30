//
//  ReaderLocalJson.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 24/04/21.
//

import Foundation

class ReaderLocalJson {
    
   static func readerLocalData(nameFile: String) throws -> Data?  {
        
        if let url = Bundle.main.url(forResource: nameFile, withExtension: "json") {
            
            do {
               return try Data(contentsOf: url )
                
            } catch {
                print("No se pudo cargar el mock -> \(error)")
                throw error
            }
                    
        }
        return nil

    }
    
}

class ParserData {
    
    
    
}

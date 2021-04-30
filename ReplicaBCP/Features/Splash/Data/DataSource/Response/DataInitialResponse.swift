//
//  DataInitialResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

struct DataInitialResponse: BaseResponse, Decodable {
    let codeResponse: Int
    let dataResponse: DataConfiguration
    
    private enum CodingKeys: String, CodingKey {
      case codeResponse = "code"
      case dataResponse = "dataConfig"
    }
   
}

struct DataConfiguration: ParametersConfiguration, Decodable {
    
    var time: Int?
    var greats: Int?
    var sounds: Bool?

}

protocol ParametersConfiguration: Decodable {
    
    var time: Int? { get set }
    var greats: Int? { get set }
    var sounds: Bool? { get set }
    
}

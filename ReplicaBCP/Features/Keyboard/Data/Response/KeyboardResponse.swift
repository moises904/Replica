//
//  KeyboardResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation

struct KeyboardResponse: BaseResponse, Decodable {
    let code: Int
    let keyboard: [Int]
    
    private enum CodingsKey: String, CodingKey {
        case codeResponse = "code"
        case keyboardNumbers = "keyboard"
    }
}

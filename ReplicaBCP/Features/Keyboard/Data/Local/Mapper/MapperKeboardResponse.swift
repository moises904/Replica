//
//  MapperKeboardResponse.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 30/04/21.
//

import Foundation


func transformKeyboard(keyboardResponse: KeyboardResponse) -> KeyboardModel {
    
    var keyboardModel: KeyboardModel = KeyboardModel()

    var pivote:Int = 0
    
    for  _ in 0..<4 {
        for  _ in 0..<3 {
            
            if(pivote < 9 ) {
                keyboardModel.table.append(keyboardResponse.keyboard[pivote])
            } else {
                 if(pivote == 10) {
                    keyboardModel.table.append(keyboardResponse.keyboard[9])
                 } else {
                    keyboardModel.table.append(-1)
                 }
            }
            
            pivote+=1
        }
    }

    return keyboardModel
}

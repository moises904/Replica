//
//  LiveData.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 25/04/21.
//

import Foundation

class LiveData<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_value: T) {
        self.value = _value
    }
    
    func observe(listener: Listener?) {
        self.listener = listener
        self.listener?(value)
    }
}

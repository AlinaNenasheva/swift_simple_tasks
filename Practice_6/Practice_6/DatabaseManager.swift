//
//  DatabaseManager.swift
//  Practice_6
//
//  Created by Алина Ненашева on 9/10/20.
//  Copyright © 2020 Алина Ненашева. All rights reserved.
//

import Foundation
class DatabaseManager{
    static let shared = DatabaseManager()
    
    private var isConnected = false
    
    private init() {}
    
    func connected(){
        if isConnected{
            return
        }else{
            print("Connect")
            isConnected = true
        }
    }
}

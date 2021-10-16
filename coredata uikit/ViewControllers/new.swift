//
//  new.swift
//  coredata uikit
//
//  Created by Visakh D on 15/10/21.
//

import Foundation

class Player {
    var name : String
    var number : Int
    
    init(name:String , number:Int) {
        self.name = name
        self.number = number
    }
    
    
    func play() {
        
    }
    
    func pause() {
       
        stop()
    }
    
    func stop() {
        
    }
}

var jhon = Player(name: "sun", number: 5)


class Next : Player {
    
    override func play() {
        
    }
}


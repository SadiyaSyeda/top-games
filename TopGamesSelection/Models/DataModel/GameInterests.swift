//
//  GameInterests.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/10/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//


import UIKit

struct TopGamesSelection : Codable{
    let _total : Int?
    let top : [Top]?
    
    init(_total : Int?, top : [Top]?){
        self._total = _total
        self.top = top
    }
}

struct Top :Codable {
    let game : Game?
    let viewers : Int?
    let channels : Int?
    
    init(game : Game?, viewers : Int?, channels : Int?){
        self.game = game
        self.viewers = viewers
        self.channels = channels
    }
}

struct Game : Codable{
    let name : String?
    let box : Box?
    init(name : String?, box : Box?){
        self.name = name
        self.box = box
    }
}

struct Box : Codable{
    let large : String?
    init(large : String?){
        self.large = large
    }
}

//
//  data.swift
//  MMS_LabProject
//
//  Created by prk on 10/20/23.
//

import Foundation

enum CategoryGame: String {
    case adventure = "Adventure"
    case horror = "Horror"
    case puzzle = "Puzzle"
    case sport  = "Sport"
    case FPS = "FPS"
}

struct dataItem{
    var priceProduct: Int
    var titleProduct: String
    var categoryProduct: CategoryGame
    var description: String
    var imageProduct: String
}

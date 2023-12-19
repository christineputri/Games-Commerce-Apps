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
    var productQuantity: Int
    
    init(priceProduct: Int, titleProduct: String, categoryProduct: CategoryGame, description: String, imageProduct: String) {
        self.priceProduct = priceProduct
        self.titleProduct = titleProduct
        self.categoryProduct = categoryProduct
        self.description = description
        self.imageProduct = imageProduct
        self.productQuantity = 0
    }
}

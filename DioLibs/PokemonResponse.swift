//
//  PokemonResponse.swift
//  DioLibs
//
//  Created by Rodolfo Navarro on 17/08/21.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let sprites: Sprites
  
    enum CodingKeys: String, CodingKey {
      
        case name
        case sprites
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let frontDefault: String
   
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

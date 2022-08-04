//
//  Pokemon.swift
//  Pokedex
//
//  Created by Wallace Santos on 01/08/22.
//

import Foundation


struct Pokemon:Decodable{
    let name:String?
    let imageUrl:String?
    let description:String?
    let height:Int?
    let weight:Int?
    let attack:Int?
    let type:String?
    let evolutionChain:[EvolutionChain]?
    
}

struct EvolutionChain:Decodable {
    let id:String?
    let name:String?
}

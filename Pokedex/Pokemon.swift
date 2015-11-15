//
//  Pokemon.swift
//  Pokedex
//
//  Created by Patrick Largen on 11/13/15.
//  Copyright © 2015 Patrick Largen. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonURL = "\(BASE_URL)\(URL_POKEMON)pokemon/\(self._pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        print(url)
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value.debugDescription)
        }
    }
}
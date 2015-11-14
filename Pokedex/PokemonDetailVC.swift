//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Patrick Largen on 11/14/15.
//  Copyright © 2015 Patrick Largen. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I GOT HERE")
        nameLabel.text = pokemon.name
        
       
    }



}

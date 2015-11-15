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
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAtack: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I GOT HERE")
        nameLabel.text = pokemon.name
        
        
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//
//  ViewController.swift
//  Pokedex
//
//  Created by Patrick Largen on 11/13/15.
//  Copyright © 2015 Patrick Largen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var musicPlayer: AVAudioPlayer!
    var pokemon = [Pokemon]()
    var inSearchMode = false
    var filteredPokemon = [Pokemon]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        initAudio()
        parsePokemonCSV()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokeCell", forIndexPath: indexPath) as? PokeCell {
            
            var poke: Pokemon!
            
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            } else {
                poke = pokemon[indexPath.row]
            }
            
            
            cell.configureCell(poke)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let poke: Pokemon!
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemon[indexPath.row]
        }
        //sender is the object we are sending
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredPokemon.count
        }
        return pokemon.count
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //sets the size of the grid
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
    }
    func initAudio() {
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
    }
    
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]
                let poke = Pokemon(name: name!, pokedexId: pokeId)
                pokemon.append(poke)
                
            }
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicButtonPressed(sender: UIButton) {
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 0.5
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()
        }
    }
    
    
    
    
}


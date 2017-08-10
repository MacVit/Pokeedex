//
//  PokemonRootVC.swift
//  Pokeedex
//
//  Created by Vitalik Maksymlyuk on 04.08.17.
//  Copyright © 2017 Vitalik Maksymlyuk. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonRootVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        
        if musicPleyer.isPlaying {
        
            musicPleyer.pause()
            sender.alpha = 0.4
        
        } else {
        
            musicPleyer.play()
            sender.alpha = 1.0
        }
        
    }
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var musicPleyer: AVAudioPlayer!
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        collection.delegate = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
        initAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
        
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
        
        } else {
        
            inSearchMode = true
            
            let lowerChar = searchBar.text!.lowercased()
            
            filteredPokemon = pokemon.filter({ $0.name.range(of: lowerChar) != nil })
            collection.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
    }

    func initAudio() {
    
        let path = Bundle.main.path(forResource: "PokeMusic", ofType: "mp3")!
        
        do {
            
            musicPleyer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPleyer.prepareToPlay()
            musicPleyer.numberOfLoops = -1
            musicPleyer.play()
            
        } catch let err as NSError {
            
            print("There some error in playing music \(err.debugDescription)")
        }
    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
            
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let addNewPokemon = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(addNewPokemon)
                
            }
            
        } catch let err as NSError {
            print("There's some error:\(err.debugDescription)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell {
            
            let poke: Pokemon!
            
            if inSearchMode {
            
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(poke)
            
            } else {
            
                poke = pokemon[indexPath.row]
                
                cell.configureCell(poke)
            }
            
            return cell
            
        } else {
        
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var poke: Pokemon!
        
        if inSearchMode {
            
            poke = filteredPokemon[indexPath.row]
        
        } else {
        
            poke = pokemon[indexPath.row]
        }
        
        performSegue(withIdentifier: "PokemonDetailVC", sender: poke)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredPokemon.count
        
        } else {
        
            return pokemon.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 87)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PokemonDetailVC" {
        
            if let detailsVC = segue.destination as? PokemonDetailVC {
            
                if let poke = sender as? Pokemon {
                
                    detailsVC.pokemonDetail = poke
                }
            }
        }
    }
}




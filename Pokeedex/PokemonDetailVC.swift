//
//  PokemonDetailVC.swift
//  Pokeedex
//
//  Created by Vitalik Maksymlyuk on 08.08.17.
//  Copyright © 2017 Vitalik Maksymlyuk. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var pokeNameLbl: UILabel!
    @IBOutlet weak var pokeImg: PokemonImageStyle!
    @IBOutlet weak var pokeDescriptionLbl: UILabel!
    @IBOutlet weak var pokeTypeLbl: UILabel!
    @IBOutlet weak var pokeDefenseLbl: UILabel!
    @IBOutlet weak var pokeHeightLbl: UILabel!
    @IBOutlet weak var pokeWeightLbl: UILabel!
    @IBOutlet weak var pokeDexIdLbl: UILabel!
    @IBOutlet weak var pokeBaseAttackLbl: UILabel!
    
    @IBOutlet weak var evoPokeLbl: UILabel!
    @IBOutlet weak var currentPokeImage: UIImageView!
    @IBOutlet weak var lvlUpPokeImage: UIImageView!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    var pokemonDetail: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonDetail.downloadPokemonDetail {
            
            // Some action with Updating UI while downloading is completed
            self.updateUI()
        }
        
        pokeNameLbl.text = pokemonDetail.name.capitalized
        
        let img = UIImage(named: "\(pokemonDetail.pokedexId)")
        pokeImg.image = img
        currentPokeImage.image = img
        pokeDexIdLbl.text = "\(pokemonDetail.pokedexId)"
        
    }
    
    func updateUI() {
        
        pokeBaseAttackLbl.text = pokemonDetail.attack
        pokeHeightLbl.text = pokemonDetail.height
        pokeWeightLbl.text = pokemonDetail.weight
        pokeDefenseLbl.text = pokemonDetail.defense
        pokeTypeLbl.text = pokemonDetail.type
        pokeDescriptionLbl.text = pokemonDetail.description
        
        if pokemonDetail.nextEvoId == "" {
            
            evoPokeLbl.text = "No Evolutions"
            lvlUpPokeImage.isHidden = true
            
        } else {
            
            lvlUpPokeImage.isHidden = false
            lvlUpPokeImage.image = UIImage(named: pokemonDetail.nextEvoId)
            let str = "Next Evolution: \(pokemonDetail.nextEvoName) - LVL \(pokemonDetail.nextEvoLvl)"
            evoPokeLbl.text = str
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

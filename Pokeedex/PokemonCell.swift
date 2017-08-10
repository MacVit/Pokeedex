//
//  PokemonCell.swift
//  Pokeedex
//
//  Created by Vitalik Maksymlyuk on 06.08.17.
//  Copyright © 2017 Vitalik Maksymlyuk. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        pokemonLbl.text = self.pokemon.name.capitalized
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}

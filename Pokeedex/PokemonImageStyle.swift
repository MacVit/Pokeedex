//
//  PokemonImageStyle.swift
//  Pokeedex
//
//  Created by Vitalik Maksymlyuk on 09.08.17.
//  Copyright © 2017 Vitalik Maksymlyuk. All rights reserved.
//

import UIKit

class PokemonImageStyle: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }

}

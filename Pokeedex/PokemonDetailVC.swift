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
    @IBOutlet weak var pokeDefenceLbl: UILabel!
    @IBOutlet weak var pokeHigthLbl: UILabel!
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

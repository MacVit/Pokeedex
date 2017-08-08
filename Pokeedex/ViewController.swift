//
//  ViewController.swift
//  Pokeedex
//
//  Created by Vitalik Maksymlyuk on 04.08.17.
//  Copyright © 2017 Vitalik Maksymlyuk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

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


}


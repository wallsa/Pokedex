//
//  GalleryViewController.swift
//  Pokedex
//
//  Created by Wallace Santos on 30/07/22.
//

import UIKit
import SDWebImage

class GalleryViewController:UICollectionViewController{
    
    var pokemons = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        showPokemons()
        collectionView.reloadData()
        
    }
    
  
    
//MARK: - Collection Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.pokemonCard, for: indexPath) as! PokemonCard
        cell.nameLabel.text = pokemons[indexPath.row].name?.capitalized
        if let safeURL = pokemons[indexPath.row].imageUrl {
            let url = URL(string: safeURL)
            cell.imageView.sd_setImage(with: url)
        }
       
        return cell
    }
    


//MARK: - API
    func showPokemons(){
        Service.shared.fetchPokemon { [weak self] result in
            switch result{
            case .success(let pokemonList):
                self?.pokemons = pokemonList
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}

//MARK: - CollectionView Settings
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func configureViewComponents(){
        collectionView.backgroundColor = .white
        navigationItem.title = "Pokedex"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
        collectionView.register(PokemonCard.self, forCellWithReuseIdentifier: K.pokemonCard)
    }
    
// Tamanho de cada celula
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
// Espacamento entre os lados da celula da collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
    }
}


//MARK: - Selectors

extension GalleryViewController{
    @objc func showSearchBar(){
        print("test")
    }
    
}

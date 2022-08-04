//
//  Service.swift
//  Pokedex
//
//  Created by Wallace Santos on 30/07/22.
//

import Foundation

struct Service {
    
    private let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    static let shared = Service()
    
    
    
//MARK: - Fetch Pokemons
    
    func fetchPokemon(completion: @escaping (Result<[Pokemon], Error>) -> ()){
        guard let url = URL(string: baseURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch the pokemon database", error)
                completion(.failure(error))
                return
            }
            //removendo o null que vem na chamada da API com um método descrito na extension abaixo
            guard let safeData = data?.parseData(removeString: "null,") else {return}
            
           
            //decodificando
            do{
                let pokemon = try JSONDecoder().decode([Pokemon].self, from: safeData)
                completion(.success(pokemon))
                print("sucesso")
            }catch{
                print("Failed to create Json,\(error)")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
}



//MARK: - Extensions

extension Data{
    func parseData(removeString string:String) -> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}

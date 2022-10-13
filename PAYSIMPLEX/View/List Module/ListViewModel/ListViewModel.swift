//
//  ListViewModel.swift
//  PAYSIMPLEX
//
//  Created by cis on 11/10/22.
//

import Foundation
import SwiftUI
import Combine


struct PokemonList: Identifiable {
    let id = UUID()
    var name : String
    var imgUrl: String
    var ability: [Ability]
}

extension ListView {
    @MainActor class ListViewModel: ObservableObject {
        
        var imgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        
        @Published var error: Error?
        @Published var lists = [Result]()
        
        @Published var pokemonList = [PokemonList]()
        
        //MARK: -
        //MARK: - Get Pokemon List
        
        func getPokemonData() async {
            let urlString = "https://pokeapi.co/api/v2/pokemon"
            
            guard let url = URL(string: urlString) else{
                print("Bad url \(urlString)")
                return
            }
            
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Pokemon.self, from: data)
                lists = items.results
                for list in lists {
                    Task {
                        await getPokemonDetails(name: list.name)
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        
        //MARK: -
        //MARK: - Get Pokemon Details List
        
        func getPokemonDetails(name: String) async {
            let urlString = "https://pokeapi.co/api/v2/pokemon/\(name)"
            
            guard let url = URL(string: urlString) else{
                print("Bad url \(urlString)")
                return
            }
            
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Profile.self, from: data)
                print(items)
                pokemonList.append(PokemonList(name: name, imgUrl: imgUrl + "\(items.id).png", ability: items.abilities))
                
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}




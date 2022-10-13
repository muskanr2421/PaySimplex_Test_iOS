//
//  ListView.swift
//  PAYSIMPLEX
//
//  Created by cis on 11/10/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var model = ListViewModel()
    
    //MARK: -
    //MARK: - Fetch and Display Pokemon List
    
    var body: some View {
        NavigationView() {
            List{
                ForEach(model.pokemonList, id:\.id){ list in
                    
                    LazyHStack{
                        AsyncImage(url: URL(string: list.imgUrl), scale: 3) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .border(Color.pink)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }                        
                        Text(list.name.capitalized)
                            .font(.title3)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarTitle("POKEMON LISTS")
            .onAppear(){
                Task{
                    await model.getPokemonData()
                }
            }
        }
    }
    
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        return ListView()
    }
}



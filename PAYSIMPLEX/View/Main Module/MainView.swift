//
//  ContentView.swift
//  PAYSIMPLEX
//
//  Created by cis on 11/10/22.
//

import SwiftUI

struct MainView: View {
    
    
    //MARK: -
    //MARK: - Create tab bars
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.circle")
                }
        }.accentColor(.blue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice("iPhone 11 Pro")
    }
}


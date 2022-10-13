//
//  MapView.swift
//  PAYSIMPLEX
//
//  Created by cis on 11/10/22.
//

import SwiftUI


struct MapView: View {
    
    //MARK: -
    //MARK: - Display Map 
    var body: some View {
        ZStack{
            MapboxMap()
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().previewDevice("iPhone 11 Pro")
    }
}



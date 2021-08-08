//
//  ContentView.swift
//  UI-280
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
     CustomTabView()
            .preferredColorScheme(.dark)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

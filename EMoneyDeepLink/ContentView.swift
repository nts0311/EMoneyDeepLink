//
//  ContentView.swift
//  EMoneyDeepLink
//
//  Created by son on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            LinkAccountView()
                .tabItem {
                    Label("Link account", systemImage: "person.crop.circle")
                }
            
            DeeplinkPaymentView()
                .tabItem {
                    Label("Deeplink payment", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

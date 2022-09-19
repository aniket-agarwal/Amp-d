//
//  SwiftUIView.swift
//  Amp'd
//
//  Created by Aniket Agarwal on 9/13/22.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    var body: some View {
            TabView (selection: $selectedTab) {
                ContentView().tabItem {
                   Image(systemName: "radio")
                }
                .tag(0)
                ListeningActivityView().tabItem {
                   Image(systemName: "flame")
                }
                .tag(1)
                
            }
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}

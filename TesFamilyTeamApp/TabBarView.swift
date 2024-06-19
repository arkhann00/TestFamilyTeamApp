//
//  TabBarView.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 18.06.2024.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedDection = 0
    var body: some View {
        TabView(selection: $selectedDection) {
            CharactersGridView()
                .tag(0)
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            LocationsView()
                .tag(1)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Locations")
                }
            EpisodesView()
                .tag(2)
                .tabItem {
                    Image(systemName: "desktopcomputer")
                    Text("Episodes")
                }
            SettingsView()
                .tag(3)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
    }
}

#Preview {
    TabBarView()
}

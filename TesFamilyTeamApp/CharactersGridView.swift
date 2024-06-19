//
//  CharactersGridView.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 18.06.2024.
//

import SwiftUI

struct CharactersGridView: View {
    
    @ObservedObject var viewModel = CharacterViewModel()
    
    let columns = [
            GridItem(),
            GridItem(),
        ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 1) {
                    
                    ForEach(viewModel.characters) { character in
                        
                        
                        CharacterCard(character: character)
                        
                    }
                }
            }
            .navigationTitle("Characters")
        }
        
       
    }
}


struct CharacterCard: View {
    
    @State var character:Character
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                CharacterView(character: character)
                    .navigationTitle(Text(character.name))
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                ZStack {
                    Rectangle()
                        .shadow(color: .black, radius: 5, x: 0)
                        
                        .foregroundStyle(.white)
                    VStack(alignment:.leading) {
                        AsyncImage(url: URL(string: character.image)) { result in
                            result.image?.resizable()
                        }
                        Text(character.name)
                            .padding(.horizontal)
                            .foregroundStyle(.black)
                            .font(.system(size: 15))
                            .bold()
                            .lineLimit(0)
                            .minimumScaleFactor(0.5)
                        Text("Status: \(character.status)")
                            .padding(.horizontal)
                            .padding(.bottom,8)
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                        
                    }
                    
                }
                .frame(maxWidth: 250)
                .frame(height: 240)
                .padding()
            }
        }
    }
}

#Preview {
    CharactersGridView()
}

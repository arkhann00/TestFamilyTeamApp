//
//  CharacterView.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 19.06.2024.
//

import SwiftUI

struct CharacterView: View {
    
    @State var character:Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { result in
                
                result.image?.resizable()
                    .scaledToFill()
                
            }
                .frame(maxWidth: .infinity)
            VStack{
                HStack {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundStyle(.blue)
                        .padding(.leading, 10)
                    Text(character.status)
                    
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                        .frame(width: 120,height: 30, alignment: .leading)
                        .lineLimit(0)
                        .minimumScaleFactor(0.1)
                        .scaledToFit()
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundStyle(.red)
                    Text(character.gender)
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                        .frame(width: 130, alignment: .leading)
                }
                .padding()
                HStack {
                    Rectangle()
                        .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .overlay {
                            Text("STATUS")
                                .foregroundStyle(.blue)
                                .font(.system(size: 19))
                                .bold()
                        }
                        
                    Rectangle()
                        .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .overlay {
                            Text("GENDER")
                                .foregroundStyle(.red)
                                .font(.system(size: 19))
                                .bold()
                        }
                        
                }
                .frame(height: 40)
                HStack {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundStyle(Color(red: 127/255, green: 0, blue: 169/255))
                        .padding(.leading,10)
                    Text(character.type == "" ? "None" : character.type)
                        .frame(width: 120,height: 30, alignment: .leading)
                        .lineLimit(0)
                        .minimumScaleFactor(0.1)
                        .scaledToFit()
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                        
                    
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 30)
                        .foregroundStyle(.green)
                    Text(character.species)
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                        .frame(width: 130, alignment: .leading)
                }
                .padding()
                HStack {
                    Rectangle()
                        .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .overlay {
                            Text("TYPE")
                                .foregroundStyle(Color(red: 127/255, green: 0, blue: 169/255))
                                .font(.system(size: 19))
                                .bold()
                        }
                        
                    Rectangle()
                        .foregroundStyle(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .overlay {
                            Text("SPECIES")
                                .foregroundStyle(.green)
                                .font(.system(size: 19))
                                .bold()
                                
                        }
                        
                }
                .frame(height: 40)
                
            }
            Spacer()
        }
    
    }
}

#Preview {
    CharacterView(character: Character(id: 1, name: "Morthy", status: "Alive", species: "Human", type: "None", gender: "Male", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: "", created: ""))
}


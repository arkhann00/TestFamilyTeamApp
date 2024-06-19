//
//  CharacterViewModel.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 18.06.2024.
//

import Foundation
import Combine

class CharacterViewModel:ObservableObject {
    
    @Published var characters:[Character] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchDataFromNetwork()
    }
    
    
    func fetchDataFromNetwork() {
        
        for i in 1...826 {
            guard let url = URL(string:"https://rickandmortyapi.com/api/character/\(i)") else { return }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: Character.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink { complition in
                    switch complition {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] character in
                    self?.characters.append(character)
                }
                .store(in: &cancellables)
            
            
        }
        
        
        
    }
}

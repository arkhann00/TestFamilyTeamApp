//
//  RemoteConfigManager.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 19.06.2024.
//

import Foundation
import Combine
import FirebaseRemoteConfig

class RemoteConfigManager: ObservableObject {
    
    static let shared = RemoteConfigManager()
    @Published var needToUpdate:Bool = true
    
    init() {}
    
    func getUpdatedResult() -> Bool {
        fetchRemoteConfig()
        return needToUpdate
    }
    
    private func fetchRemoteConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
            let settings = RemoteConfigSettings()
            settings.minimumFetchInterval = 0
            remoteConfig.configSettings = settings
            
            remoteConfig.fetch { [weak self] status, error in
                if status == .success {
                    print("Success fetch!")
                    remoteConfig.activate { changed, error in
                        guard error == nil else { return }
                        DispatchQueue.main.async {
                            self?.needToUpdate = remoteConfig["needForceUpdate"].boolValue
                        }
                    }
                } else {
                    print("Fail fetch(")
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    
}

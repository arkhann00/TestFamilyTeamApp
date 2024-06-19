//
//  UpdateView.swift
//  TesFamilyTeamApp
//
//  Created by Khachatryan Arsen on 19.06.2024.
//

import SwiftUI

struct UpdateView: View {
    @ObservedObject var remoteConfig = RemoteConfigManager()
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .padding()
                            .foregroundStyle(.blue)
                            .overlay {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundStyle(.white)
                                    Text("UPDATE NOW")
                                        .foregroundStyle(.white)
                                }
                            }
                    }
                }

            }
        }
    }
}

#Preview {
    UpdateView()
}

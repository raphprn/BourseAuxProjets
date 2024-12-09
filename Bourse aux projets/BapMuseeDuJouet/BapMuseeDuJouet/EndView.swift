//
//  EndView.swift
//  BapMuseeDuJouet
//
//  Created by Raphaël Parone on 05/12/2024.
//

import SwiftUI

struct EndScreenView: View {
    var body: some View {
        ZStack {
            // Fond gradient animé identique aux autres écrans
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 50)
            
            VStack {
                Spacer()
                
                // Texte "Merci d’avoir discuté avec moi !" centré
                Text("Merci d’avoir discuté avec moi !")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                // Boutons uniformes alignés
                VStack(spacing: 20) {
                    ForEach(["Revenir à l’écran d’accueil", "Choisir un autre personnage", "Poser d’autres questions"], id: \.self) { title in
                        Button(action: {
                            print("\(title) tapé")
                        }) {
                            Text(title)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity) // Uniformité pour alignement
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .frame(height: 60) // Taille fixe pour uniformité
                        .padding(.horizontal, 150) // Égalité des marges horizontales
                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    EndScreenView()
}

//
//  SelectionView.swift
//  BapMuseeDuJouet
//
//  Created by Raphaël Parone on 04/12/2024.
//

import SwiftUI

struct SelectionView: View {
    let toys = [
        Toy(name: "Téléphone", image: "phone_image", description: "Un jouet interactif qui aide à développer l'imagination."),
        Toy(name: "Sophie la Girafe", image: "sophie_image", description: "Une peluche classique et très aimée des enfants."),
        Toy(name: "Playmobil", image: "playmobil_image", description: "Un personnage d'une grande collection de jouets créatifs.")
    ]
    
    @State private var selectedToy = 0
    
    var body: some View {
        ZStack {
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 50)
            
            VStack {
                Spacer().frame(height: 20)
                
                Text("Choisissez un jouet")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                
                Spacer()

                TabView(selection: $selectedToy) {
                    ForEach(0..<toys.count, id: \.self) { index in
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 8)
                                    .frame(width: 450, height: 650)
                                    .shadow(radius: 15)
                                
                                Image(toys[index].image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 450, height: 450)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .opacity(self.selectedToy == index ? 1 : 0.5)
                                    .scaleEffect(self.selectedToy == index ? 1.0 : 0.9)
                                    .rotation3DEffect(
                                        .degrees(self.selectedToy == index ? 0 : 10),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                                    .animation(.easeInOut(duration: 0.5), value: selectedToy)
                                
                                VStack {
                                    Text(toys[index].name)
                                        .font(.system(size: 36, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 10)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                    Text(toys[index].description)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.top, 5)
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: 520, height: 700)
                .padding(.horizontal, 50)
                
                Spacer()
                
                Button(action: {
                    print("Jouet sélectionné: \(toys[selectedToy].name)")
                }) {
                    Text("Choisir")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer().frame(height: 50)
            }
        }
    }
}

struct Toy {
    var name: String
    var image: String
    var description: String
}

#Preview {
    SelectionView()
}

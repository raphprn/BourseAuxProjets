//
//  QuestionsView.swift
//  BapMuseeDuJouet
//
//  Created by Raphaël Parone on 05/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 50)
            
            VStack {
                Spacer()
                
                Text("Bienvenue au musée du jouet de Poissy !")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    print("Commencer tapped!")
                }) {
                    Text("Commencer")
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

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    let colors = [
        Color.orange.opacity(0.9), // Teinte orange foncé
        Color.orange.opacity(0.8), // Teinte orange moyen
        Color.orange.opacity(0.7), // Teinte orange plus claire
        Color.orange.opacity(0.6), // Teinte encore plus claire
        Color.orange.opacity(0.5)  // Teinte très claire
    ]
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: start,
            endPoint: end
        )
        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true))
        .onReceive(timer) { _ in
            self.start = UnitPoint(x: Double.random(in: -1...1), y: Double.random(in: -1...1))
            self.end = UnitPoint(x: Double.random(in: -1...1), y: Double.random(in: -1...1))
        }
    }
}

#Preview {
    ContentView()
}

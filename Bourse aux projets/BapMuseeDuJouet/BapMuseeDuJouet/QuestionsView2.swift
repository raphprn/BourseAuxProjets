//
//  QuestionsView2.swift
//  BapMuseeDuJouet
//
//  Created by Raphaël Parone on 05/12/2024.
//

import SwiftUI

struct QuestionView2: View {
    @State private var selectedQuestion: String? = nil
    @State private var currentLevel: Int = 1
    
    let questions = [
        ["Question 1", "Question 2", "Question 3"],
        ["Sous-Q1-1", "Sous-Q1-2", "Sous-Q1-3"],
        ["Sous-Q2-1", "Sous-Q2-2", "Sous-Q2-3"],
    ]
    
    var body: some View {
        ZStack {
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 50)
            
            VStack {
                Spacer()
                
                Text("Questions - Niveau \(currentLevel)")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        ForEach(questions[currentLevel - 1].prefix(2), id: \.self) { question in
                            Button(action: {
                                selectedQuestion = question
                                if currentLevel < 3 {
                                    currentLevel += 1
                                }
                            }) {
                                Text(question)
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 250, height: 250)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                            .disabled(selectedQuestion == question)
                        }
                    }
                    
                    if let thirdQuestion = questions[currentLevel - 1].last {
                        Button(action: {
                            selectedQuestion = thirdQuestion
                            if currentLevel < 3 {
                                currentLevel += 1
                            }
                        }) {
                            Text(thirdQuestion)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.black)
                                .frame(width: 250, height: 250)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .disabled(selectedQuestion == thirdQuestion)
                    }
                }
                .padding()
                
                Spacer()
                
                if let question = selectedQuestion {
                    Text("Jouant la vidéo/audio pour : \(question)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

#Preview {
    QuestionView()
}

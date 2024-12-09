//
//  QuestionsView.swift
//  BapMuseeDuJouet
//
//  Created by Raphaël Parone on 05/12/2024.
//

import SwiftUI
import AVKit

struct QuestionView1: View {
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
                    .padding(.horizontal, 40)
                
                Spacer()
                
                VStack(spacing: 20) {
                    ForEach(questions[currentLevel - 1], id: \.self) { question in
                        Button(action: {
                            selectedQuestion = question
                            playVideo(named: "\(question.lowercased().replacingOccurrences(of: " ", with: "_"))_video")
                            if currentLevel < questions.count {
                                currentLevel += 1
                            }
                        }) {
                            Text(question)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 40)
                                .padding(.vertical, 20)
                                .background(selectedQuestion == question ? Color.gray : Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .disabled(selectedQuestion == question)
                    }
                }
                .padding()
                
                Spacer()
                
                if let question = selectedQuestion {
                    Text("Lecture vidéo/audio pour : \(question)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
    
    func playVideo(named videoName: String) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            print("Vidéo introuvable pour \(videoName)")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.player?.play()

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(playerController, animated: true)
        }
    }
}

#Preview {
    QuestionView()
}

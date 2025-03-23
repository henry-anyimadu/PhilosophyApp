//
//  QuizView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct QuizView: View {
    let concept: PhilosophyConcept
    @State private var selectedAnswer: Int? = nil
    @State private var showExplanation = false
    
    // Sample quiz questions - would come from Firebase in real app
    let questions = [
        QuizQuestion(
            id: "q1",
            text: "What is the main focus of this philosophical concept?",
            options: [
                "Understanding the nature of reality",
                "Determining right and wrong actions",
                "Examining how we acquire knowledge",
                "Analyzing the meaning of language"
            ],
            correctAnswerIndex: 1,
            explanation: "This concept primarily focuses on ethical considerations and how we determine which actions are morally right or wrong."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let currentQuestion = questions.first {
                // Question text
                Text(currentQuestion.text)
                    .font(.headline)
                    .padding(.bottom, 8)
                
                // Answer options
                ForEach(0..<currentQuestion.options.count, id: \.self) { index in
                    Button(action: {
                        selectedAnswer = index
                        showExplanation = true
                    }) {
                        HStack {
                            Text("\(["A", "B", "C", "D"][index]).")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 28, height: 28)
                                .background(
                                    selectedAnswer == index
                                        ? (index == currentQuestion.correctAnswerIndex ? Color.green : Color.red)
                                        : Color.blue
                                )
                                .cornerRadius(14)
                            
                            Text(currentQuestion.options[index])
                                .foregroundColor(.primary)
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            if selectedAnswer == index {
                                Image(systemName: index == currentQuestion.correctAnswerIndex ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(index == currentQuestion.correctAnswerIndex ? .green : .red)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .disabled(selectedAnswer != nil)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Explanation
                if showExplanation {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Explanation")
                            .font(.headline)
                        
                        Text(currentQuestion.explanation)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            // Continue to next question or complete
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .transition(.opacity)
                }
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut, value: showExplanation)
    }
}

//#Preview {
//    QuizView()
//}

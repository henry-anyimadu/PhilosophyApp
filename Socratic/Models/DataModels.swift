//
//  DataModels.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//  MODEL: Core Data Models

import Foundation
import SwiftUI

struct PhilosophyConcept: Identifiable {
    let id: String
    let title: String
    let description: String
    let branch: PhilosophyBranch
    let difficulty: Int
    let prerequisites: [String]
    let isUnlocked: Bool
    let completionPercentage: Double
}

enum PhilosophyBranch: String, CaseIterable {
    case ethics = "Ethics"
    case epistemology = "Epistemology"
    case metaphysics = "Metaphysics"
    case logic = "Logic"
    case aesthetics = "Aesthetics"
    
    var color: Color {
        switch self {
        case .ethics: return Color.green
        case .epistemology: return Color.blue
        case .metaphysics: return Color.purple
        case .logic: return Color.orange
        case .aesthetics: return Color.pink
        }
    }
    
    var icon: String {
        switch self {
        case .ethics: return "heart.fill"
        case .epistemology: return "brain.head.profile"
        case .metaphysics: return "sparkles"
        case .logic: return "function"
        case .aesthetics: return "paintpalette.fill"
        }
    }
}

struct QuizQuestion: Identifiable {
    let id: String
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
    let explanation: String
}

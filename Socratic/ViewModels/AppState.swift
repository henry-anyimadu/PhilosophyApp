//
//  AppState.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//  ViewModel: App State

import Foundation

class AppState: ObservableObject {
    @Published var isAuthenticated = true
    @Published var currentUser: User?
    @Published var streakCount = 0
    @Published var dailyGoalCompleted = false
    @Published var userProgress: [String: Double] = [:]
    
    // Sample data for prototype
    @Published var philosophyConcepts: [PhilosophyConcept] = [
        PhilosophyConcept(id: "ethics1", title: "Introduction to Ethics", description: "Understanding the basics of ethical reasoning", branch: .ethics, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.8),
        PhilosophyConcept(id: "ethics2", title: "Virtue Ethics", description: "Aristotle's approach to ethical living", branch: .ethics, difficulty: 2, prerequisites: ["ethics1"], isUnlocked: true, completionPercentage: 0.5),
        PhilosophyConcept(id: "ethics3", title: "Utilitarianism", description: "The greatest happiness principle", branch: .ethics, difficulty: 2, prerequisites: ["ethics1"], isUnlocked: true, completionPercentage: 0.2),
        PhilosophyConcept(id: "epistemology1", title: "Introduction to Epistemology", description: "The study of knowledge and justified belief", branch: .epistemology, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.3),
        PhilosophyConcept(id: "metaphysics1", title: "Introduction to Metaphysics", description: "The nature of reality and existence", branch: .metaphysics, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.0)
    ]
    
    func logout() {
        // Implement Firebase logout
        isAuthenticated = false
        currentUser = nil
    }
}

struct User {
    let id: String
    let name: String
    let email: String
    var streakDays: Int
    var achievements: [String]
}


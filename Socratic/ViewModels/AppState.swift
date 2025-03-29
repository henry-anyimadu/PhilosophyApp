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
        // Ethics branch
                PhilosophyConcept(id: "ethics1", title: "Introduction to Ethics", description: "Understanding the basics of ethical reasoning", branch: .ethics, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.8),
                PhilosophyConcept(id: "ethics2", title: "Virtue Ethics", description: "Aristotle's approach to ethical living", branch: .ethics, difficulty: 2, prerequisites: ["ethics1"], isUnlocked: true, completionPercentage: 0.5),
                PhilosophyConcept(id: "ethics3", title: "Utilitarianism", description: "The greatest happiness principle", branch: .ethics, difficulty: 2, prerequisites: ["ethics1"], isUnlocked: true, completionPercentage: 0.2),
                PhilosophyConcept(id: "ethics4", title: "Deontological Ethics", description: "Kant's duty-based moral framework", branch: .ethics, difficulty: 3, prerequisites: ["ethics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "ethics5", title: "Applied Ethics", description: "Ethical principles in practical contexts", branch: .ethics, difficulty: 3, prerequisites: ["ethics2", "ethics3", "ethics4"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "ethics6", title: "Meta-Ethics", description: "The nature of ethical properties and statements", branch: .ethics, difficulty: 4, prerequisites: ["ethics5"], isUnlocked: false, completionPercentage: 0.0),
                
                // Epistemology branch
                PhilosophyConcept(id: "epistemology1", title: "Introduction to Epistemology", description: "The study of knowledge and justified belief", branch: .epistemology, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.3),
                PhilosophyConcept(id: "epistemology2", title: "Rationalism", description: "Knowledge through reason and intuition", branch: .epistemology, difficulty: 2, prerequisites: ["epistemology1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "epistemology3", title: "Empiricism", description: "Knowledge through sensory experience", branch: .epistemology, difficulty: 2, prerequisites: ["epistemology1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "epistemology4", title: "Skepticism", description: "Questioning the possibility of knowledge", branch: .epistemology, difficulty: 2, prerequisites: ["epistemology1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "epistemology5", title: "Contemporary Epistemology", description: "Modern approaches to knowledge", branch: .epistemology, difficulty: 3, prerequisites: ["epistemology2", "epistemology3", "epistemology4"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "epistemology6", title: "Social Epistemology", description: "Knowledge in social contexts", branch: .epistemology, difficulty: 3, prerequisites: ["epistemology5"], isUnlocked: false, completionPercentage: 0.0),
                
                // Metaphysics branch
                PhilosophyConcept(id: "metaphysics1", title: "Introduction to Metaphysics", description: "The nature of reality and existence", branch: .metaphysics, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.0),
                PhilosophyConcept(id: "metaphysics2", title: "Ontology", description: "The study of being and existence", branch: .metaphysics, difficulty: 2, prerequisites: ["metaphysics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "metaphysics3", title: "Free Will & Determinism", description: "The debate on freedom of choice", branch: .metaphysics, difficulty: 2, prerequisites: ["metaphysics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "metaphysics4", title: "Mind-Body Problem", description: "The relationship between mind and matter", branch: .metaphysics, difficulty: 3, prerequisites: ["metaphysics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "metaphysics5", title: "Personal Identity", description: "What makes a person the same over time", branch: .metaphysics, difficulty: 3, prerequisites: ["metaphysics2", "metaphysics4"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "metaphysics6", title: "Modal Metaphysics", description: "Possibility, necessity, and contingency", branch: .metaphysics, difficulty: 4, prerequisites: ["metaphysics2", "metaphysics3"], isUnlocked: false, completionPercentage: 0.0),
                
                // Logic branch
                PhilosophyConcept(id: "logic1", title: "Introduction to Logic", description: "The study of valid reasoning", branch: .logic, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.0),
                PhilosophyConcept(id: "logic2", title: "Deductive Logic", description: "Reasoning from general to specific", branch: .logic, difficulty: 2, prerequisites: ["logic1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "logic3", title: "Inductive Logic", description: "Reasoning from specific to general", branch: .logic, difficulty: 2, prerequisites: ["logic1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "logic4", title: "Formal Logic", description: "Symbolic representation of arguments", branch: .logic, difficulty: 3, prerequisites: ["logic2"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "logic5", title: "Logical Fallacies", description: "Common errors in reasoning", branch: .logic, difficulty: 2, prerequisites: ["logic1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "logic6", title: "Modal Logic", description: "Logic of necessity and possibility", branch: .logic, difficulty: 4, prerequisites: ["logic4"], isUnlocked: false, completionPercentage: 0.0),
                
                // Aesthetics branch
                PhilosophyConcept(id: "aesthetics1", title: "Introduction to Aesthetics", description: "The philosophy of art and beauty", branch: .aesthetics, difficulty: 1, prerequisites: [], isUnlocked: true, completionPercentage: 0.0),
                PhilosophyConcept(id: "aesthetics2", title: "Beauty & Taste", description: "Subjective and objective aspects of beauty", branch: .aesthetics, difficulty: 2, prerequisites: ["aesthetics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "aesthetics3", title: "Art & Expression", description: "Art as a form of emotional expression", branch: .aesthetics, difficulty: 2, prerequisites: ["aesthetics1"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "aesthetics4", title: "Aesthetic Experience", description: "The nature of aesthetic appreciation", branch: .aesthetics, difficulty: 3, prerequisites: ["aesthetics2", "aesthetics3"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "aesthetics5", title: "Art Criticism", description: "Evaluating and interpreting art", branch: .aesthetics, difficulty: 3, prerequisites: ["aesthetics4"], isUnlocked: false, completionPercentage: 0.0),
                PhilosophyConcept(id: "aesthetics6", title: "Aesthetics & Society", description: "Social and political dimensions of art", branch: .aesthetics, difficulty: 4, prerequisites: ["aesthetics5"], isUnlocked: false, completionPercentage: 0.0)
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

extension AppState {
    // Update concept completion and automatically unlock dependent concepts
    func updateConceptProgress(conceptId: String, newCompletionPercentage: Double) {
        // Find the concept to update
        guard let conceptIndex = philosophyConcepts.firstIndex(where: { $0.id == conceptId }),
              let oldConcept = philosophyConcepts.first(where: { $0.id == conceptId }) else {
            return
        }
        
        // Create a new concept instance with updated completion percentage
        let clampedPercentage = min(1.0, max(0.0, newCompletionPercentage))
        let updatedConcept = PhilosophyConcept(
            id: oldConcept.id,
            title: oldConcept.title,
            description: oldConcept.description,
            branch: oldConcept.branch,
            difficulty: oldConcept.difficulty,
            prerequisites: oldConcept.prerequisites,
            isUnlocked: oldConcept.isUnlocked,
            completionPercentage: clampedPercentage
        )
        
        // Update the concept in the array
        philosophyConcepts[conceptIndex] = updatedConcept
        
        // If concept is completed, check if any dependent concepts should be unlocked
        if updatedConcept.completionPercentage >= 1.0 {
            unlockDependentConcepts(for: conceptId)
        }
        
        // Update user progress
        userProgress[conceptId] = updatedConcept.completionPercentage
    }
    
    // Unlock concepts that depend on the completed concept
    private func unlockDependentConcepts(for completedConceptId: String) {
        // Find concepts that have this concept as a prerequisite
        let dependentConcepts = philosophyConcepts.filter { concept in
            concept.prerequisites.contains(completedConceptId)
        }
        
        // For each dependent concept, check if all prerequisites are completed
        for dependentConcept in dependentConcepts {
            let allPrerequisitesMet = dependentConcept.prerequisites.allSatisfy { prerequisiteId in
                if let prerequisite = philosophyConcepts.first(where: { $0.id == prerequisiteId }) {
                    return prerequisite.completionPercentage >= 1.0
                }
                return false
            }
            
            // If all prerequisites are met, unlock the concept
            if allPrerequisitesMet {
                if let index = philosophyConcepts.firstIndex(where: { $0.id == dependentConcept.id }) {
                    // Create a new concept with updated unlock status
                    let newConcept = PhilosophyConcept(
                        id: dependentConcept.id,
                        title: dependentConcept.title,
                        description: dependentConcept.description,
                        branch: dependentConcept.branch,
                        difficulty: dependentConcept.difficulty,
                        prerequisites: dependentConcept.prerequisites,
                        isUnlocked: true,
                        completionPercentage: dependentConcept.completionPercentage
                    )
                    philosophyConcepts[index] = newConcept
                }
            }
        }
    }
    
    // Get the next concept to learn (first unlocked but incomplete concept)
    func getNextConcept(for branch: PhilosophyBranch? = nil) -> PhilosophyConcept? {
        let filteredConcepts = branch == nil
            ? philosophyConcepts
            : philosophyConcepts.filter { $0.branch == branch }
        
        return filteredConcepts
            .filter { $0.isUnlocked && $0.completionPercentage < 1.0 }
            .sorted { $0.difficulty < $1.difficulty }
            .first
    }
    
    // Calculate progress for a specific branch
    func branchProgress(_ branch: PhilosophyBranch) -> Double {
        let branchConcepts = philosophyConcepts.filter { $0.branch == branch }
        if branchConcepts.isEmpty { return 0.0 }
        
        let totalProgress = branchConcepts.reduce(0.0) { $0 + $1.completionPercentage }
        return totalProgress / Double(branchConcepts.count)
    }
    
    // Calculate total progress across all branches
    func totalProgress() -> Double {
        if philosophyConcepts.isEmpty { return 0.0 }
        
        let totalProgress = philosophyConcepts.reduce(0.0) { $0 + $1.completionPercentage }
        return totalProgress / Double(philosophyConcepts.count)
    }
}

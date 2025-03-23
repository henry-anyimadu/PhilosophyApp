//
//  AchievementView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct AchievementView: View {
    let icon: String
    let title: String
    let description: String
    let isUnlocked: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(isUnlocked ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                
                Image(systemName: isUnlocked ? icon : "lock.fill")
                    .foregroundColor(.white)
                    .font(.system(size: isUnlocked ? 30 : 24))
            }
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 4)
                .opacity(isUnlocked ? 1.0 : 0.6)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 120)
                .opacity(isUnlocked ? 1.0 : 0.6)
        }
        .padding()
        .frame(width: 140, height: 160)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

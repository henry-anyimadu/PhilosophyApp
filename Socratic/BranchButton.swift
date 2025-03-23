//
//  BranchButton.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct BranchButton: View {
    let branch: PhilosophyBranch
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                ZStack {
                    Circle()
                        .fill(isSelected ? branch.color : Color(.systemGray5))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: branch.icon)
                        .foregroundColor(isSelected ? .white : branch.color)
                        .font(.system(size: 24))
                }
                
                Text(branch.rawValue)
                    .font(.caption)
                    .foregroundColor(isSelected ? branch.color : .primary)
            }
        }
    }
}
//#Preview {
//    BranchButton()
//}

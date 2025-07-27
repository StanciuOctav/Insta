//
//  StoryUserInfoRow.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct UserInfoRow: View {
    let user: StoryUser
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: user.profilePicSystemName)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Text(user.name)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
    }
}

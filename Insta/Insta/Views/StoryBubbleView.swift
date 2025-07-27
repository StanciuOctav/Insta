//
//  StoryBubbleView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct StoryBubbleView: View {
    let user: StoryUser
    let size: CGFloat
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(
                    user.isSeen ? AnyShapeStyle(Color.gray) : AnyShapeStyle(LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.red]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )),
                    lineWidth: 4
                )
                .frame(width: size, height: size)
            
            Image(systemName: user.profilePicSystemName)
                .resizable()
                .scaledToFill()
                .frame(width: size - 8, height: size - 8)
                .clipShape(Circle())
        }
        .onTapGesture {
            onTap()
        }
    }
}

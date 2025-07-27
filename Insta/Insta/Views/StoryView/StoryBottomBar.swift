//
//  BottomBar.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct BottomBar: View {
    @Binding var messageText: String
    @Binding var isLiked: Bool
    @Binding var likeScale: CGFloat
    
    var body: some View {
        HStack(spacing: 12) {
            TextField("Send message..", text: $messageText)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.08))
                .foregroundColor(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
                .disabled(true)
            Button(action: {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.4)) {
                    isLiked.toggle()
                    likeScale = 1.3
                }
                withAnimation(.spring().delay(0.1)) {
                    likeScale = 1.0
                }
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(isLiked ? .red : .white)
            }
            .scaleEffect(likeScale)
            Image(systemName: "paperplane")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(0.12), lineWidth: 1)
        )
    }
}

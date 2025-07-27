//
//  StoryView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct StoryView: View {
    let users: [StoryUser]
    @State var currentUserIndex: Int
    @State var currentStoryIndex: Int
    let onClose: () -> Void
    
    @State private var timer: Timer? = nil
    @State private var progress: Double = 0
    private let duration: Double = 10.0
    @State private var messageText: String = ""
    @State private var isLiked: Bool = false
    @State private var imageOpacity: Double = 0
    @State private var likeScale: CGFloat = 1.0
    
    private var currentUser: StoryUser { users[safe: currentUserIndex] ?? users.first! }
    private var currentStory: Story? { currentUser.stories[safe: currentStoryIndex] }
    
    var body: some View {
        ZStack {
            Rectangle().fill(.ultraThickMaterial).ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear, Color.black.opacity(0.3)]),
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            GeometryReader { geo in
                VStack(spacing: 0) {
                    ZStack {
                        VStack(spacing: 0) {
                            ProgressBarRow(storyCount: currentUser.stories.count, currentIndex: currentStoryIndex, progress: progress)
                                .padding(.top, 44)
                                .padding(.horizontal, 16)
                            UserInfoRow(user: currentUser)
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                            Spacer()
                            if let story = currentStory {
                                Image(systemName: story.systemName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                                    .background(
                                        RoundedRectangle(cornerRadius: 32)
                                            .fill(Color.white.opacity(0.05))
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 8)
                                    .opacity(imageOpacity)
                                    .onAppear {
                                        withAnimation(.easeIn(duration: 0.5)) { imageOpacity = 1 }
                                    }
                            }
                            Spacer()
                        }

                        VStack {
                            HStack {
                                Color.clear
                                    .contentShape(Rectangle())
                                    .onTapGesture { previousStoryOrUser() }
                                Color.clear
                                    .contentShape(Rectangle())
                                    .onTapGesture { nextStoryOrUser() }
                            }
                            .frame(height: geo.size.height - 100)
                            Spacer(minLength: 0)
                        }
                        .allowsHitTesting(true)
                    }
                    BottomBar(messageText: $messageText, isLiked: $isLiked, likeScale: $likeScale)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.height > 60 { onClose() }
                }
        )
        .onAppear {
            startTimer()
            imageOpacity = 0
        }
        .onDisappear { timer?.invalidate() }
    }
    
    private func startTimer() {
        progress = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { t in
            progress += 0.05 / duration
            if progress >= 1 {
                progress = 1
                t.invalidate()
                nextStoryOrUser()
            }
        }
    }
    
    private func nextStoryOrUser() {
        if currentStoryIndex < currentUser.stories.count - 1 {
            currentStoryIndex += 1
            startTimer()
        } else if currentUserIndex < users.count - 1 {
            currentUserIndex += 1
            currentStoryIndex = 0
            startTimer()
        } else {
            onClose()
        }
    }
    
    private func previousStoryOrUser() {
        if currentStoryIndex > 0 {
            currentStoryIndex -= 1
            startTimer()
        } else if currentUserIndex > 0 {
            currentUserIndex -= 1
            let prevUser = users[safe: currentUserIndex] ?? users.first!
            currentStoryIndex = max(0, prevUser.stories.count - 1)
            startTimer()
        } else {
            onClose()
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

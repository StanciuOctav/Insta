//
//  StoriesViewModel.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

class StoriesViewModel: ObservableObject {
    @Published var stories: [StoryUser] = []
    private let dataLoader: StoriesDataLoader
    private var allPages: [[StoryUser]] = []
    private var currentPage: Int = 0
    private var isLoading: Bool = false
    
    init(dataLoader: StoriesDataLoader) {
        self.dataLoader = dataLoader
        self.loadAllPages()
    }
    
    private func loadAllPages() {
        do {
            let all = try dataLoader.loadStoriesByPage()
            self.allPages = all
            self.stories = all.first ?? []
            self.currentPage = 1
        } catch {
            print("ERROR LOADING STORIES \(error)")
        }
    }
    
    func loadMoreStoriesIfNeeded(currentIndex: Int) {
        guard !isLoading else { return }
        if currentIndex >= stories.count - 5 {
            isLoading = true
            let nextPage = allPages[currentPage % allPages.count]
            let idOffset = stories.count
            let uniquePage = nextPage.enumerated().map { (offset, user) -> StoryUser in
                var copy = user
                copy.id = idOffset + offset + 1 // unique for SwiftUI
                // originalId is already set from JSON
                return copy
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.stories.append(contentsOf: uniquePage)
                self.currentPage += 1
                self.isLoading = false
            }
        }
    }
}

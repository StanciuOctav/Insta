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
    
    init(dataLoader: StoriesDataLoader) {
        self.dataLoader = dataLoader
    }
    
    func loadStories() {
        do {
            self.stories = try dataLoader.loadStories()
        } catch {
            print("ERROR LOADING STORIES \(error)")
        }
    }
}

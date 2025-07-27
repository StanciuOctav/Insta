//
//  MainViewModel.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    private let dataLoader: StoriesDataLoader
    
    init() {
        self.dataLoader = StoriesDataLoader()
    }
    
    func returnStoriesViewModel() -> StoriesViewModel {
        return StoriesViewModel(dataLoader: dataLoader)
    }
}

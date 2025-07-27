//
//  StorageDataLoader.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import Foundation

class StoriesDataLoader {
    func loadStoriesByPage() throws -> [[StoryUser]] {
        guard let url = Bundle.main.url(forResource: "pages", withExtension: "txt") else {
            throw StoriesDataLoaderError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let root = try decoder.decode(StoriesRoot.self, from: data)
            return root.pages.map { $0.users }
        } catch {
            throw StoriesDataLoaderError.decodingFailed(error)
        }
    }
}

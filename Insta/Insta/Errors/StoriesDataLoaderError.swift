//
//  StoriesDataLoaderError.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import Foundation

enum StoriesDataLoaderError: Error {
    case fileNotFound
    case decodingFailed(Error)
}

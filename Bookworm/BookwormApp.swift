//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kern Goretzky on 2025-06-19.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}

//
//  Day50ChallengeApp.swift
//  Day50Challenge
//
//  Created by Constantin Lisnic on 14/12/2024.
//

import SwiftData
import SwiftUI

@main
struct Day50ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

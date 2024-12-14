//
//  ContentView.swift
//  Day50Challenge
//
//  Created by Constantin Lisnic on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.isActive ? "Active" : "Inactive")
                    }
                }
            }
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .navigationTitle("Challenge 60")
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
        }
    }

    func loadData() async {
        guard
            let url = URL(
                string:
                    "https://www.hackingwithswift.com/samples/friendface.json")
        else {
            print("Invalid URL")

            return
        }

        do {
            // return the data at the url
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // decodes received data from JSON into swift structs
            if let decodedResponse = try decoder.decode(
                [User]?.self, from: data)
            {
                users = decodedResponse
            }
        } catch {
            print("Invalid data: \(error)")
        }
    }
}

#Preview {
    ContentView()
}

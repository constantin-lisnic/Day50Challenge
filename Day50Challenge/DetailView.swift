//
//  DetailView.swift
//  Day50Challenge
//
//  Created by Constantin Lisnic on 14/12/2024.
//

import SwiftUI

struct DetailView: View {
    var user: User

    var body: some View {
        VStack {
            Text(user.about)
            Text("Age: \(user.age)")
                .font(.headline)
                .padding()

            Text("Registered: \(user.registered)")
            
            ForEach(user.friends) { friend in
                Text(friend.name)
            }
        }
    }
}

#Preview {
    DetailView(
        user: User(
            id: UUID(), isActive: true, name: "Constantin Lisnic", age: 26,
            company: "BT Group", email: "constantin.lisnic@bt.com",
            address: "14 Alwyn Close", about: "Muscular and handsome",
            registered: .now, tags: ["tag1", "tag2"],
            friends: [
                Friend(id: UUID(), name: "John Doe"),
                Friend(id: UUID(), name: "Ana Lisnic"),
            ]))
}

//
//  DetailView.swift
//  Bookworm
//
//  Created by Kern Goretzky on 2025-07-03.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book

    // Date formatter for display
    private let bookDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Genre image
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .padding(.bottom)

                Text(book.genre)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)

                Text("Review")
                    .font(.headline)
                Text(book.review)
                    .font(.body)

                Text("Added on \(bookDateFormatter.string(from: book.date))")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // Temporary preview book for testing
    let example = Book(title: "Sample Book", author: "John Doe", genre: "Fantasy", review: "A thrilling adventure!", rating: 4)
    return DetailView(book: example)
}

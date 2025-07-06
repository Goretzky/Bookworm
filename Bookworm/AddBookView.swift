//
//  AddBookView.swift
//  Bookworm
//
//  Created by Kern Goretzky on 2025-06-25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    // Computed property to check if form is valid
    var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty &&
        !author.trimmingCharacters(in: .whitespaces).isEmpty &&
        !genre.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title.trimmingCharacters(in: .whitespaces),
                            author: author.trimmingCharacters(in: .whitespaces),
                            genre: genre,
                            review: review,
                            rating: rating,
                            date: .now
                        )
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(!isFormValid) // Disable button if form is invalid
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

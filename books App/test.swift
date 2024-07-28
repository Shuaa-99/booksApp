//
//  test.swift
//  books App
//
//  Created by SHUAA on 25.7.2024.
//

import SwiftUI

struct test: View {
        @ObservedObject var viewModel = BooksViewModel()
        var body: some View {
            NavigationView {
                List(viewModel.books) { book in
                    VStack(alignment: .leading) {
                        HStack {
                            if let coverID = book.cover_i {
                                let urlString = "https://covers.openlibrary.org/b/id/\(coverID)-M.jpg"
                                AsyncImage(url: URL(string: urlString)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 75)
                                } placeholder: {
                                    Color.gray
                                        .frame(width: 50, height: 75)
                                }
                            } else {
                                Color.gray
                                    .frame(width: 50, height: 75)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                if let authors = book.author_name {
                                    Text(authors.joined(separator: ", "))
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                if let publisher = book.publisher {
                                    Text("Publisher: \(publisher)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                if let rating = book.rating {
                                    Text("Rating: \(rating, specifier: "%.1f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Books")
            }
        }
    }

#Preview {
    test()
}

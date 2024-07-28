//
//  HorizontalBooksView.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import SwiftUI

struct HorizontalBooksView: View {
    //    var books = Books()
    @State var isPresented = false
    @ObservedObject var viewModel = BooksViewModel()
    var body: some View {
        VStack {
            HStack{
                Text("Recommended")
                    .font(.system(size: 22,weight: .medium,design: .rounded))
                    .foregroundColor(.gray)
                Spacer()
            }.padding([.top,.horizontal])
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(viewModel.books){ book in
                        HStack{
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
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                            } else {
                                Color.gray
                                    .frame(width: 50, height: 75)
                            }
                            VStack{
                                Text(book.title)
                                    .font(.system(size: 20,weight: .medium,design: .rounded))
                                if let authors = book.author_name {
                                    Text(authors.joined(separator: ", "))
                                        .font(.system(size: 15,weight: .medium,design: .rounded))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }.padding()
        }
        
    }
}



#Preview {
    HorizontalBooksView()
}

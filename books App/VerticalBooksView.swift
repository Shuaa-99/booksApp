//
//  VerticalBooksView.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import SwiftUI

struct VerticalBooksView: View {
//    var books = Books()
    @ObservedObject var viewModel = BooksViewModel()
    @State var isPresented = false
    var body: some View {
        VStack{
                HStack{
                    Text("All Books")
                        .font(.system(size: 22,weight: .medium,design: .rounded))
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.system(size: 25,weight: .bold,design: .rounded))
                    
                }
            NavigationStack {
                VStack{
                    
                    List(viewModel.books) { book in
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 340,height: 220)
                                    .foregroundColor(.gray)
                                HStack{
                                    if let coverID = book.cover_i {
                                        let urlString = "https://covers.openlibrary.org/b/id/\(coverID)-M.jpg"
                                        AsyncImage(url: URL(string: urlString)) { image in
                                            image
                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 105, height: 155)
                                        } placeholder: {
                                            Color.gray
                                                .frame(width: 50, height: 75)
                                        }
                                    } else {
                                        Color.gray
                                            .frame(width: 50, height: 75)
                                    }
                                    VStack{
                                        Text(book.title)
                                            .font(.system(size: 20,weight: .bold,design: .rounded))
                                        if let authors = book.author_name {
                                            Text(authors.joined(separator: ", "))
                                                .font(.system(size: 15 ,weight: .medium ,design: .rounded))
                                                .foregroundColor(.red)
                                                .padding(.bottom,50)
                                        }
                                        
                                        HStack{
                                            ForEach(0..<4){star in
                                                HStack{
                                                    Image(systemName: "star.fill")
                                                        .font(.title3)
                                                        .foregroundColor(.yellow)
                                                    
                                                }
                                            }
                                            Image(systemName: "star")
                                                .font(.title3)
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                    Spacer()
                                    
                                }.padding(.leading,40)
                            }.padding(.bottom)
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                        }
                        
                        
                    }
                }
                
                
                
                
            }
        }
    }
}

#Preview {
    VerticalBooksView()
}

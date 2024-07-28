//
//  BooksModel.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import Foundation



struct Book: Identifiable, Decodable {
    let id: String
    let title: String
    let author_name: [String]?
    let cover_i: Int?
    var publisher: String?
    var rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case title
        case author_name
        case cover_i
    }
}

struct OpenLibraryResponse: Decodable {
    let docs: [Book]
}

struct BookDetails: Decodable {
    let publishers: [String]?
    let average_rating: Double?
}


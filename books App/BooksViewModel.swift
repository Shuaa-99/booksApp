//
//  BooksViewModel.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import Foundation
import Combine
//
//class BooksViewModel: ObservableObject {
//    @Published var books = [Book]()
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        fetchBooks()
//    }
//    
//    func fetchBooks() {
//        let urlString = "https://openlibrary.org/search.json?q=swift"
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: OpenLibraryResponse.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { _ in }, receiveValue: { response in
//                self.books = response.docs
//            })
//            .store(in: &cancellables)
//    }
//}
//

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchBooks()
    }
    
    func fetchBooks() {
        let urlString = "https://openlibrary.org/search.json?q=swift"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: OpenLibraryResponse.self, decoder: JSONDecoder())
            .map { $0.docs }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] books in
                self?.books = books
                self?.fetchAdditionalDetails()
            }
            .store(in: &cancellables)
    }
    
    private func fetchAdditionalDetails() {
        let group = DispatchGroup()
        
        for (index, book) in books.enumerated() {
            guard let workKey = book.id.split(separator: "/").last else { continue }
            let detailsURLString = "https://openlibrary.org/works/\(workKey).json"
            guard let url = URL(string: detailsURLString) else { continue }
            
            group.enter()
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: BookDetails.self, decoder: JSONDecoder())
                .replaceError(with: BookDetails(publishers: nil, average_rating: nil))
                .receive(on: DispatchQueue.main)
                .sink { [weak self] details in
                    self?.books[index].publisher = details.publishers?.first
                    self?.books[index].rating = details.average_rating
                    group.leave()
                }
                .store(in: &cancellables)
        }
        
        group.notify(queue: .main) {
            self.objectWillChange.send()
        }
    }
}

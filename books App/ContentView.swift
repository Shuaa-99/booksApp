//
//  ContentView.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import SwiftUI

struct ContentView: View {
//var books = Books()
    @State var isPresented = false

    var body: some View {
 
            VStack {
                HStack{
                 Text("Hello Shuaa")
                        .font(.system(size: 30,weight: .bold,design: .rounded))
                    Spacer()
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "cart")
                    } .font(.system(size: 25,weight: .bold,design: .rounded))

                    
                }.padding(.horizontal)
//                ScrollView(.vertical,showsIndicators: false){
                    HorizontalBooksView()
                    Divider()
                    VerticalBooksView()
//                }
            }
            .padding()
    }
}

#Preview {
    ContentView()
}


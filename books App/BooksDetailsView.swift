//
//  BooksDetailsView.swift
//  books App
//
//  Created by SHUAA on 24.7.2024.
//

import SwiftUI

struct BooksDetailsView: View {
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            VStack{
                Image("image1")
                    .resizable()
                    .frame(width: 200,height: 250)
                    .cornerRadius(10)
                Text("firstBook")
                    .font(.system(size: 28,weight: .bold,design: .rounded))
                Text("firstNme")
                    .font(.system(size: 28,weight: .medium,design: .rounded))
                    .foregroundColor(.gray)
                Button(action: {}) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 330,height: 55)
                            .foregroundColor(.pink)
                        Text("Purchase The Book")
                            .font(.system(size: 23,weight: .bold,design: .rounded))
                            .foregroundColor(.white)
                    }
                }.padding(.vertical)
                Spacer()
            }.padding(40)
            
        }
   
    }
}


#Preview {
    BooksDetailsView()
}

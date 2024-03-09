//
//  ReviewView.swift
//  RideShare
//
//  Created by Bryan Ardon on 3/8/24.
//

import SwiftUI

struct ReviewView: View {
    @State private var profileImage: Image = Image("ProfilePicture")
    @State private var username: String = "Gorilla Joe"
    @State private var textField: String = ""
    @State private var drivingSince: String = "1990"
    @State private var trips: Int = 2351
    @State private var rating: Int = 5
    @State private var title:String = "I AM TITLE"
    @State private var author:String = "Bryan"
    @State private var content:String = "Gorilla Joe was an awesome driver for his first time. Great at arriving to my destination in a timely manner. The limit for text is three lines right?"
    @State private var date:String = "2024"
    var body: some View {
        ZStack {
            Rectangle()
//            Image("Background")
//                .resizable()
                .fill(.bar)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
//                .frame(width: 10, height: 10)
//                .foregroundColor(.clear)
//                .edgesIgnoringSafeArea(.all)
                
            VStack {
                // Profile Image
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 220)
                    .clipShape(Circle())
                    .padding(15)
                
                Text(username)
                    .font(.title)
                    .padding()
                Spacer().frame(height: 20)

                // Bio
                HStack(spacing: 20){
                   ForEach(1...5, id: \.self) { index in
                       Image(systemName: index <= rating ? "star.fill" : "star")
                           .resizable()
                           .foregroundColor(index <= rating ? .yellow : .gray)
                           .onTapGesture {
                               self.rating = index
                           }
                           .frame(width: 30, height: 30)
                           }
                    Text("\(rating).0")
                        .font(.title2)
                }
                TextField(
                        "User name (email address)",
                        text: $username
                    )
                Text("Leave a Compliment")
                    .font(.title2)
                    .bold()
                    VStack(alignment: .leading, spacing: 10) {
    //                    Text(title)
    //                        .font(.title)
    //                        .fontWeight(.bold)
                        TextField("Your review", text: $textField)
                            .font(.body)
                        Text("By Danny • \(date)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(maxWidth: 370)
                Button(action: {}) {
                    Text("Submit")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                        .padding()
                }
                    
                    
                
                
            }
        }
            
        }
       
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}


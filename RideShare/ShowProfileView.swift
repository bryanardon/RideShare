//
//  ShowProfileView.swift
//  RideShare
//
//  Created by Bryan Ardon on 3/8/24.
//

import SwiftUI

struct ShowProfileView: View {
    @State private var profileImage: Image = Image("ProfilePicture")
    @State private var username: String = "Gorilla Joe"
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
                Text("\(username)")
                    .font(.title)
                Spacer().frame(height:5)
                Text("Your Driver")
                    .font(.callout)
//                    .padding()
                
                // Profile Image
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 220)
                    .clipShape(Circle())
//                        .overlay(
//                            Circle().stroke(Color.black, lineWidth: 2)
//                        )
                    .padding(15)
                Spacer().frame(height: 50)

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
                }
                
                HStack(spacing: 45) {
                    VStack {
                        Text("\(trips)")
                            .font(.title)
                        Spacer().frame(height:10)
                        Text("Trips")
                            .font(.title3)
                    }
                    .padding()
                    
                    VStack {
                        Text("\(drivingSince)")
                            .font(.title)
                        Spacer().frame(height:10)
                        Text("Driving since")
                            .font(.title3)
                    }
                    .padding()
                }
                Text("Compliments")
                    .font(.title2)
                    .bold()
                    VStack(alignment: .leading, spacing: 10) {
    //                    Text(title)
    //                        .font(.title)
    //                        .fontWeight(.bold)
                        Text(content)
                            .font(.body)
                            .lineLimit(3)
                        Text("By \(author) • \(date)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
    //                    Text(content)
    //                        .font(.body)
//                            .lineLimit(3) // Limit content to 3 lines
                    }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(maxWidth: 370)
                    
                    
                
                
            }
        }
            
        }
       
}

struct ShowProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ShowProfileView()
    }
}


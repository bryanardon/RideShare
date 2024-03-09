//
//  ContentView.swift
//  RideShare
//
//  Created by Bryan Ardon on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        Text("Home Page")
                            .font(.largeTitle)
                            .padding()
                        VStack {
                            NavigationLink(destination: ProfileView()) {
                                Text("Go to ProfileView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                            NavigationLink(destination: AcceptRideView()) {
                                Text("Go to AcceptRideView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                            NavigationLink(destination: RideCompleteView()) {
                                Text("Go to RideCompleteView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                            NavigationLink(destination: ReviewView()) {
                                Text("Go to ReviewView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                            NavigationLink(destination: ShowProfileView()) {
                                Text("Go to ShowProfileView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                            NavigationLink(destination: DriverAcceptedView()) {
                                Text("Go to DriverAcceptedView")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                        .navigationTitle("")
                            
                        }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

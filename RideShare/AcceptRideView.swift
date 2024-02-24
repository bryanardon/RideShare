//
//  AcceptRideView.swift
//  RideShare
//
//  Created by Bryan Ardon on 2/23/24.
//

import SwiftUI


struct AcceptRideView: View {
    @State private var passengerImage: Image = Image("Kirby")
    @State private var passengerName: String = "Kirby"
    @State private var passengerFare: String = "17.92"
    @State var countdown: Int = 5
    @State private var timer: Timer?
    private func startCountdown() {
          guard timer == nil else { return }
          timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
              withAnimation {
                  if countdown > 0 {
                      countdown -= 1
                  } else {
                      timer?.invalidate()
                      timer = nil
                  }
              }
          }
      }
    private var timerColor: Color {
         let percentage = Double(countdown) / 10.0
         return Color(red: 1.0 - percentage, green: percentage, blue: 0.0)
     }
    
    var body: some View {
        ZStack{
            //Background Image
            Image("Background")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .blur(radius: 5)
               .edgesIgnoringSafeArea(.all)
            //Inside box
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment:.center ,spacing: 10 ) {
                    Text(passengerName)
                    passengerImage
//                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 200)
                        .clipShape(Circle())
                            .overlay(
                               Circle().stroke(Color.black, lineWidth: 2)
                            )
                        .padding(15)
//                    Spacer().frame(height: 50)
                    Text("$\(passengerFare)")
                    
                }
                Button(action: startCountdown) {
                            Text("Countdown: \(countdown)")
                                .padding()
                                .foregroundColor(.white)
                                .background(timerColor)
                                .cornerRadius(10)
                        }
                Button(action:{}){
                    Text("Decline")
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
               
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            
        }
      
    }
}

struct AcceptRideView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptRideView()
    }
}

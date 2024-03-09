//
//  DriverAcceptedView.swift
//  RideShare
//
//  Created by Bryan Ardon on 3/8/24.
//
import SwiftUI


struct DriverAcceptedView: View {
    @State private var passengerImage: Image = Image("Kirby")
    @State private var passengerName: String = "Lila"
    @State private var passengerFare: String = "17.92"
    @State var countdown: Int = 5
    @State private var timer: Timer?
    @State private var address: String = "123 S CEO drive"
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
         return Color(red:255, green: percentage, blue: percentage)
     }
    
    var body: some View {
        ZStack {
            //Background Image
            Image("ExcellentMap")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 5)
                .edgesIgnoringSafeArea(.all)
            //Inside box
            VStack(alignment: .center, spacing: 10) {
                Spacer().frame(width: 50, height: 3)
                Text("RIDE ACCEPTED")
                    .font(.bold(.title)())
                Spacer().frame(height: 20)
                VStack(alignment: .center, spacing: 10) {
                    Text(passengerName)
                        .font(.title2)
                    passengerImage
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(15)
                    HStack() {
                        Text("Earnings")
                            .font(.title3)
                        Text("$\(passengerFare)")
                            .font(.title)
                    }
                }
                Spacer().frame(height: 30)
                Text("PROCEED TO: ")
                Text(address)
                    .font(.bold(.title2)())
                Spacer().frame(width: 50, height: 3)
            }
            .padding(40) // Adjust padding here
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

struct DriverAcceptedView_Previews: PreviewProvider {
    static var previews: some View {
        DriverAcceptedView()
    }
}

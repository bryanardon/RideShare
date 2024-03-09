//
//  RideCompleteView.swift
//  RideShare
//
//  Created by Bryan Ardon on 2/24/24.
//

import SwiftUI
import UserNotifications

func scheduleLocalNotification() {
    let content = UNMutableNotificationContent()
    content.title = "RideShare"
    content.body = "Lily left a 5 ⭐️ Review"
    
    // Define trigger based on time interval
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false) // Notification will fire 5 seconds after scheduling
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        } else {
            print("Notification scheduled successfully")
        }
    }
}

func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else if let error = error {
                print("Error requesting notification authorization: \(error)")
            }
        }
    }

struct RideCompleteView: View {
    @State private var distance: String = "2.7 mi"
    @State private var earnings: String = "$18.12"
    @State private var isButtonVisible = true
  
    var body: some View {
        ZStack(){
            Image("ExcellentMap")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 5)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                Text("RIDE COMPLETE")
                    .font(.bold(.largeTitle)())
                    .foregroundColor(.white)
                Spacer().frame(height:70)
               HStack(spacing: 45) {
                   VStack {
                       Text("\(distance)")
                           .font(.bold(.title)())
                           .foregroundColor(.white)
                       Spacer().frame(height:10)
                       Text("Distance")
                           .font(.bold(.callout)())
                           .foregroundColor(.white)
                   }
                   .padding()
                   
                   VStack {
                       Text("\(earnings)")
                           .font(.bold(.title)())
                           .foregroundColor(.white)
                       Spacer().frame(height:10)
                       Text("Earnings")
                           .font(.bold(.callout)())
                           .foregroundColor(.white)
                   }
                   .padding()
               }
                
                if isButtonVisible {
                    Button("Schedule Notification") {
                         scheduleLocalNotification()
                         isButtonVisible = false
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            requestNotificationAuthorization()
        }
    }
}
//

struct RideCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        RideCompleteView()
    }
}

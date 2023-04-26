//
//  NotificationsView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI

struct Notification: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

let dummyNotifications = [
    Notification(title: "Monthly Budget Exceeded", message: "Your monthly budget has been exceeded. Click here to adjust your budget."),
    Notification(title: "Credit Card Payment Due", message: "You have a credit card payment due in 2 days. Click here to pay now."),
    Notification(title: "Portfolio Decreased", message: "Your investment portfolio has decreased by 5%. Click here to review your investments.")
]

struct NotificationsView: View {
    @State var selectedNotification: Notification?
    
    var body: some View {
        NavigationView {
            List(dummyNotifications) { notification in
                Button(action: {
                    selectedNotification = notification
                }) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(notification.title)
                            .font(.headline)
                        Text(notification.message)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Notifications")
        }
        .sheet(item: $selectedNotification) { notification in
            NotificationDetailView(notification: notification)
        }
    }
}

struct NotificationDetailView: View {
    let notification: Notification
    
    var body: some View {
        VStack {
            Text(notification.title)
                .font(.largeTitle)
                .padding()
            Text(notification.message)
                .font(.body)
                .foregroundColor(.gray)
                .padding()
            Button(action: {}) {
                Text("Take Action")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationTitle(notification.title)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

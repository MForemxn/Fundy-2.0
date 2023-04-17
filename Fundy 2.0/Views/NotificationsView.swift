//
//  NotificationsView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Color.blue
            
            Image(systemName: "bell")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

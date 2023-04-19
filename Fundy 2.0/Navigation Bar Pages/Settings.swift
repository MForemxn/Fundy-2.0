//
//  Settings.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 19/4/2023.
//

import SwiftUI

class Setting: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

struct SettingsPage: View {
    let settings = [
        Setting(name: "Notifications", imageName: "bell.badge"),
        Setting(name: "Currency", imageName: "dollarsign.circle"),
        Setting(name: "Touch ID", imageName: "touchid"),
    ]
    
    var body: some View {
        NavigationView {
            List(settings) { setting in
                NavigationLink(destination: SettingDetailView(setting: setting)) {
                    SettingRowView(setting: setting)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingRowView: View {
    let setting: Setting
    
    var body: some View {
        HStack {
            Image(systemName: setting.imageName)
                .foregroundColor(.blue)
                .font(.system(size: 22))
            Text(setting.name)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
    }
}

struct SettingDetailView: View {
    let setting: Setting
    @State private var isToggled: Bool = true
    @State private var selectedOption: String = "AUD"
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: setting.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text(setting.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 16)
            Spacer()
            if setting.name == "Notifications" {
                Toggle("Enable Notifications", isOn: $isToggled)
                    .padding(.horizontal)
            } else if setting.name == "Currency" {
                Picker("Select Currency", selection: $selectedOption) {
                    Text("AUD").tag("AUD")
                    Text("USD").tag("USD")
                    Text("NZD").tag("NZD")
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            } else if setting.name == "Touch ID" {
                Toggle("Enable Touch ID", isOn: $isToggled)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle(setting.name)
    }
}

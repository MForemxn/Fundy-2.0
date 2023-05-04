//
//  WhatsNewView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

//imports swiftUI framework
import SwiftUI

//creates a new view, conforms to the View protocol
struct WhatsNewView: View {
    
    //@environment used to reference the dismiss method, so that the dismiss button can be changed
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                //body property is implimented, and within it is nested a vstack and a scrollview
                
                Text("What's New in Fundy")
                    .font(.largeTitle.weight(.bold))
                    .frame(width: 240)
                    .clipped()
                    .multilineTextAlignment(.center)
                    .padding(.top, 82)
                    .padding(.bottom, 52)
                VStack(spacing: 28) {
                    HStack {
                        Image(systemName: "target")
                            .foregroundColor(.blue)
                            .font(.title.weight(.regular))
                            .frame(width: 60, height: 50)
                            .clipped()
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Keep an Eye on those Goals")
                                .font(.footnote.weight(.semibold))
                            Text("Easily add, customise, and view goals at a glance")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                    }
                }
                
                HStack {
                    Image(systemName: "bell.badge.fill")
                        .foregroundColor(.blue)
                        .font(.title.weight(.regular))
                        .frame(width: 60, height: 50)
                        .clipped()
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Get Notified!")
                            .font(.footnote.weight(.semibold))
                        Text("Added notification page to deliver the most important information, right to your overview page.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    
                }
                
                HStack {
                    Image(systemName: "book")
                        .foregroundColor(.blue)
                        .font(.title.weight(.regular))
                        .frame(width: 60, height: 50)
                        .clipped()
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Let Us Help You!")
                            .font(.footnote.weight(.semibold))
                        Text("Fundy now allows for suggestions and recommendations based on spending and saving habits")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    
                }
                
                HStack {
                    Image(systemName: "sparkles")
                        .foregroundColor(.blue)
                        .font(.title.weight(.regular))
                        .frame(width: 60, height: 50)
                        .clipped()
                    VStack(alignment: .leading, spacing: 3) {
                        Text("And Lots More!")
                            .font(.footnote.weight(.semibold))
                        Text("More chart formatting options, new print and PDF export options, and more.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    
                }
                
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Complete feature list")
                    Image(systemName: "chevron.forward")
                        .imageScale(.small)
                }
                .padding(.top, 32)
                .foregroundColor(.blue)
                .font(.subheadline)
                Spacer()
                Button("Continue") {
                    dismiss()
                    
                }
                .font(.callout.weight(.semibold))
                .padding()
                .frame(maxWidth: .infinity)
                .clipped()
                .foregroundColor(.white)
                .background(.blue)
                .mask { RoundedRectangle(cornerRadius: 16, style: .continuous) }
                .padding(.bottom, 60)
            }
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.top, 53)
        .padding(.bottom, 0)
        .padding(.horizontal, 29)
        .overlay(alignment: .top) {
        }
    }
}

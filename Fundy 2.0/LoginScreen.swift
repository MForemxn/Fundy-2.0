//
//  LoginScreen.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//


import SwiftUI

struct LoginScreen: View {
    var body: some View {
        VStack {
            Image("MyImage")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 356, height: 480)
                .clipped()
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 11) {
                        RoundedRectangle(cornerRadius: 17, style: .continuous)
                            .fill(Color(.sRGB, red: 100/255, green: 174/255, blue: 236/255))
                            .frame(width: 72, height: 72)
                            .clipped()
                            .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.12), radius: 8, x: 0, y: 4)
                            .overlay {
                                Image(systemName: "dollarsign")
                                    .imageScale(.large)
                                    .symbolRenderingMode(.monochrome)
                                    .font(.system(size: 31, weight: .regular, design: .default))
                            }
                        VStack(alignment: .leading, spacing: 1) {
                            Text("Fundy")
                                .font(.largeTitle.weight(.medium))
                            Text("Welcome to the Future of Finances.")
                                .font(.headline.weight(.medium))
                                .frame(width: 190, alignment: .leading)
                                .clipped()
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                    .padding(.top, 42)
                }
                .overlay(alignment: .bottom) {
                    Group {
                        
                    }
                }
                .mask {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                }
                .padding()
                .padding(.top, 40)
                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.15), radius: 18, x: 0, y: 14)
            VStack(spacing: 10) {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "apple.logo")
                            .imageScale(.medium)
                        Text("Continue with Apple")
                    }
                    .font(.body.weight(.medium))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255))
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(.clear.opacity(0.25), lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.black.opacity(1.00)))
                    }
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "envelope.fill")
                        .imageScale(.medium)
                    Text("Continue with Email")
                }
                .font(.body.weight(.medium))
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .clipped()
                .foregroundColor(Color(.sRGB, red: 100/255, green: 174/255, blue: 236/255))
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.clear.opacity(0.25), lineWidth: 0)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.blue.opacity(0.15)))
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

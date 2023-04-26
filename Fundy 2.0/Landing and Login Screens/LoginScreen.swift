//
//  LoginScreen.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var hasAccount: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var isAuthenticated: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    Picker(selection: $hasAccount) {
                        Text("Login")
                            .tag(true)
                        Text("Sign up")
                            .tag(false)
                    } label: {
                        Text("")
                    }
                    .padding(.vertical, 20)
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                    if hasAccount {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 80, weight: .bold, design: .default))
                                .tint(.white)
                                .padding()
                        }
                        .padding(.vertical, 40)
                    }
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        SecureField("Password", text: $password)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }
                    
                    if hasAccount {
                        Button(action: {
                            if email == "admin@icloud.com" && password == "password" {
                                isAuthenticated = true
                            }
                        }) {
                            NavigationLink {
                                Homepage()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Login")
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding(.vertical, 12)
                                    Spacer()
                                }
                                .background(Color.blue)
                                .cornerRadius(8)
                            }
                            .padding(.vertical, 40)
                            .padding(.horizontal, 20)
                        }
                    } else {
                        Button(action: {
                            if email.isValidEmail && password.isValidPassword {
                                isAuthenticated = true
                            }
                        }) {
                            NavigationLink() {
                                Homepage()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Sign Up")
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding(.vertical, 12)
                                    Spacer()
                                }
                                .background(Color.blue)
                                .cornerRadius(8)
                            }
                            .padding(.vertical, 40)
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .padding(.vertical, 20)
            .background(Color.background.ignoresSafeArea())
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

extension String {
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        return count >= 6
    }
}

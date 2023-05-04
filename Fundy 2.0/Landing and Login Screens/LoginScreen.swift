//
//  LoginScreen.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI


// Define a new view called LoginScreen.
struct LoginScreen: View {
    
    // Define some state variables.
    @State var hasAccount: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var isAuthenticated: Bool = false
    @State var buttonClicked: Bool = false
    
    var body: some View {
        
        // Wrap the view in a navigation view.
        NavigationView {
            
            // Create a scroll view for the main content of the view.
            ScrollView {
                
                // Create a vertical stack to hold the various elements of the login screen.
                VStack(spacing: 40) {
                    
                    // Create a segmented control to switch between the login and sign up screens.
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
                    
                    // If the user is logging in, show a button with their profile image.
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
                    
                    // Create a text field for the user's email address and a secure field for their password.
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
                    
                    // If the user is logging in, show a "login" button. If they're signing up, show a "sign up" button.
                    if hasAccount {
                        Button(action: {
                            buttonClicked = true
                        }) {
                            NavigationLink {
                                if checkForAuthentication(email: email, password: password, hasAccount: hasAccount) == true {
                                    Homepage()
                                        .navigationBarBackButtonHidden(true)
                                    var buttonClicked = false
                                } else {
                                    ThisPageDoesNotExist()
                                    var buttonClicked = false
                                }
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
                            var buttonClicked = true
                        }) {
                            NavigationLink() {
                                if checkForAuthentication(email: email, password: password, hasAccount: hasAccount) {
                                    Homepage()
                                        .navigationBarBackButtonHidden(true)
                                    var buttonClicked = false
                                } else {
                                    ThisPageDoesNotExist()
                                    var buttonClicked = false
                                }
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
    
    func checkForAuthentication(email: String, password: String, hasAccount: Bool) -> Bool {
        var isAuthenticated: Bool = false
        if hasAccount {
            if email == "cameron@fundy.com" && password == "password" {
                isAuthenticated = true
            }
        } else {
            if email.isValidEmail && password.isValidPassword {
                isAuthenticated = true
            }
        }
        return isAuthenticated
    }
}
    
    
    extension String {
        var isValidEmail: Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: self)
        }
        
        var isValidPassword: Bool {
            return true
        }
    }

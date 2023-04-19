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
        NavigationView{
            ScrollView{
                VStack {
                    Picker(selection: $hasAccount) {
                        Text("Login")
                            .tag(true)
                        Text("Sign up")
                            .tag(false)
                    } label: {
                        Text("")
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                if hasAccount {
                    Button {
                        
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80, weight: .bold, design: .default))
                            .padding()
                    }
                }
                Group{
                    TextField ("Email", text: $email)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)
                }.padding()
                    .textInputAutocapitalization(TextInputAutocapitalization.never)
                
                
                if hasAccount {
                    Button(action: {
                        // Perform login action here
                        isAuthenticated = true
                    }) {
                        NavigationLink {
                            Homepage()
                        } label: {
                            HStack {
                                Spacer()
                                Text("Login")
                                    .foregroundColor(.white).bold()
                                    .padding(.vertical, 12)
                                Spacer()
                            }.background(Color.blue)
                        }
                        
                    }
                } else {
                    Button(action: {
                        // Perform sign up action here
                        isAuthenticated = true
                    }) {
                        NavigationLink() {
                            Homepage()
                        } label: {
                            HStack {
                                Spacer()
                                Text("Sign Up")
                                    .foregroundColor(.white).bold()
                                    .padding(.vertical, 12)
                                Spacer()
                            }.background(Color.blue)
                        }
                    }
                }
            }
            .background((Color.background).ignoresSafeArea())
        }
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

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
                    .padding(.vertical, 40)
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                if hasAccount {
                    Button {
                        
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80, weight: .bold, design: .default))
                            .padding()
                    }
                    .padding(.vertical, 100)
                }
                Group{
                    TextField ("Email", text: $email)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)
                }.padding()
                    .textInputAutocapitalization(TextInputAutocapitalization.never)
                
                
                if hasAccount {
                    Button(action: {
                        isAuthenticated = true
                    }) {
                        NavigationLink {
                            Homepage()
                            .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack {
                                Spacer()
                                Text("Login")
                                    .foregroundColor(.white).bold()
                                    .padding(.vertical, 12)
                                Spacer()
                            }.background(Color.blue)
                        }
                        .padding(.vertical, 100)
                        
                    }
                } else {
                    Button(action: {
                        // Perform sign up action here
                        isAuthenticated = true
                    }) {
                        NavigationLink() {
                            Homepage()
                            .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack {
                                Spacer()
                                Text("Sign Up")
                                    .foregroundColor(.white).bold()
                                    .padding(.vertical, 12)
                                Spacer()
                            }.background(Color.blue)
                        }
                        .padding(.vertical, 100)
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

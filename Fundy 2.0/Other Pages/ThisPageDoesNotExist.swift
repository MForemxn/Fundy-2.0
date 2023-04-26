//
//  ThisPageDoesNotExist.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 19/4/2023.
//

import SwiftUI

struct ThisPageDoesNotExist: View {
    var body: some View {
        Text("Your Login Credentials Are Incorrect")
        Text("")
        Text("Please use 'cameron@fundy.com' ")
        Text("and 'password' if signing in")
        Text("")
        Text("or a valid email if creating an account")
    }
}

struct ThisPageDoesNotExist_Previews: PreviewProvider {
    static var previews: some View {
        ThisPageDoesNotExist()
    }
}

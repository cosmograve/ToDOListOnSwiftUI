//
//  RegistrationView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Enter your registration infos", color: .green)
            
            Form {
                TextField("Full Name", text: $name)
                TextField("Email Address", text: $email)
                SecureField("Password", text: $password)
                TDLButton(title: "Create Account", color: .green, action: {
                    //
                })
                

            }
            .offset(y: -50)
             
            Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

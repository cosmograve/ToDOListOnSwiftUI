//
//  LoginView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To do List", subtitle: "My first SwiftUI App", color: .purple)
                
                //            Login Form
                Form {
                    TextField("Email", text: $email)
                    //                    .tex tFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                    
                    TDLButton(title: "Log in", color: .purple, action: {
                        //
                    })
                    
                }
                .offset(y: -50)
                //
                //Create Account
                VStack {
                    Text("Dont have Account?")
                    NavigationLink("Create Account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


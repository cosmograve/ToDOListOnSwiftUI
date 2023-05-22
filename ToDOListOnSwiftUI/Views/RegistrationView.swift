//
//  RegistrationView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Enter your registration infos", color: .green)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                TextField("Email Address", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
                TDLButton(title: "Create Account", color: .green, action: {
                    viewModel.register()
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

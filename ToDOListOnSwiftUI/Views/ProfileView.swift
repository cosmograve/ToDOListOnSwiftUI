//
//  ProfileView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                profile(user: user)
                
            } else {
                Text("Loading profile...")
                    .bold()
                    .font(.largeTitle)
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 200, height: 200)
                .padding()
            
            Form() {
                
                HStack {
                    Text("Name:")
                        .bold()
                    Text(user.name)
                }
                .padding(.leading)
                
                HStack {
                    Text("Email:")
                        .bold()
                    Text(user.email)
                }
                .padding(.leading)
                HStack {
                    Text("Member since:")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding(.leading)
                TDLButton(title: "Log out", color: .red) {
                    viewModel.logOut()
                }
                .frame(height: 80)
            }
            .navigationTitle("Profile")
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

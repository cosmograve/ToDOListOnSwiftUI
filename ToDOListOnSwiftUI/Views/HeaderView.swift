//
//  HeaderView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:  0)
                .foregroundColor(color)
                
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white )
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            } .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 6, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", color: Color.purple)
    }
}

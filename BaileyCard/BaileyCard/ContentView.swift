//
//  ContentView.swift
//  BaileyCard
//
//  Created by Bailey Search on 07/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.18, green: 0.21, blue: 0.25)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Bailey Search")
                    .font(Font.custom("Montserrat-Regular", size: 40)) // Custom Font from google fonts
                    .foregroundColor(.white)
                    .bold()
                Text("Subtitle")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+44 123 123 123", imageName: "phone.fill")
                InfoView(text: "myemail@email.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  LoginViewSwiftUI
//
//  Created by Bhushan Borse DXC on 10/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var phoneNumber: String = ""
    @State var password: String = ""

    var body: some View {
    
        ZStack {
            BackgroundView()
            VStack {
                LoginView()
                CredentialsView()
                LoginButtonView()
                SignUpView()
                
            }
            .padding()
        }
        .ignoresSafeArea()
        .frame(height: .infinity)
    }
    
    
    
    @ViewBuilder
    func BackgroundView() -> some View {
        Image("BG")
            .resizable()
       Rectangle()
            .fill(.black.opacity(0.7))
    }
    
    @ViewBuilder
    func LoginView() -> some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
        
        Text("Sign In")
            .font(GilroyFont(isBold: true, size: 30))
            .foregroundColor(.white)
        
        Text("We've already met!")
            .font(GilroyFont(isBold: false, size: 14))
            .kerning(1)
            .multilineTextAlignment(.center)
            .foregroundColor(.white.opacity(0.7))
    }
    
    @ViewBuilder
    func CredentialsView() -> some View {
        VStackLayout(spacing: 30) {
            PhoneNumberTextFields(icon: "iphone.gen1", placeHolder: "Phone Number", text: $phoneNumber)
            
            SecurePasswordTextFields(icon: "lock", placeHolder: "Password", text: $password)
            
            Text("Forgot Password?")
                .font(GilroyFont(isBold: true, size: 16))
                .kerning(0.6)
                .underline()
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.66, green: 0.49, blue: 0.22))
        }
        .frame(height: 300)
    }
    
    @ViewBuilder
    func LoginButtonView() -> some View {
        Button {
            
        } label: {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 320, height: 56)
                .background(Color(red: 0.33, green: 0.26, blue: 0.24))
                .cornerRadius(9)
                .overlay {
                    VStack {
                        Text("Sign In")
                            .font(GilroyFont(isBold: true, size: 18))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
        }
    }
    
    @ViewBuilder
    func SignUpView() -> some View {
        HStack {
            Text("Don't have an account?")
                .font(GilroyFont(size: 16))
                .kerning(0.3)
                .foregroundColor(.white)
            
            Text("Sign Up")
                .font(GilroyFont(isBold: true, size: 16))
                .kerning(0.6)
                .underline()
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.66, green: 0.49, blue: 0.22))
        }
    }
}

#Preview {
    ContentView()
}

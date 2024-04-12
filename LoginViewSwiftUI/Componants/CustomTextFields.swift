//
//  CustomTextFields.swift
//  LoginViewSwiftUI
//
//  Created by Bhushan Borse DXC on 10/04/24.
//

import SwiftUI

struct PhoneNumberTextFields: View {
    
    let icon: String
    let placeHolder: String
    @Binding var text: String
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero

    
    var body: some View {
        HStack {
            TextField("", text: $text)
                .foregroundColor(.white)
                .font(GilroyFont(isBold: true, size: 20))
                .keyboardType(.numberPad)
                .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 60, bottom: 15, trailing: 60)))
                .overlay {
                    GeometryReader(content: { geometry in
                        Color.clear.onAppear(perform: {
                            width = geometry.size.width
                        })
                    })
                }
        }
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0, to: 0.55)
                    .stroke(.gray, lineWidth: 1)
                
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                    .stroke(.gray, lineWidth: 1)
                
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 34, height: 34)
                    
                    Spacer()
                }
                .frame(width: .infinity)
                .padding()
                
                Text(placeHolder)
                    .foregroundColor(.white)
                    .overlay {
                        GeometryReader(content: { geometry in
                            Color.clear.onAppear(perform: {
                                labelWidth = geometry.size.width
                            })
                        })
                    }
                    .padding(2)
                    .font(GilroyFont(isBold: true, size: 13))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: 20, y: -10)
            }
        }
    }
    
}

struct SecurePasswordTextFields: View {
    
    let icon: String
    let placeHolder: String
    @Binding var text: String
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero

    @State private var visibleInput: String = ""
    @State private var isSecured: Bool = true

    
    var body: some View {
        HStack {
            TextField("", text: $visibleInput)
                .foregroundColor(.white)
                .font(GilroyFont(isBold: true, size: 20))
                .keyboardType(.numberPad)
                .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 60, bottom: 15, trailing: 60)))
                .overlay {
                    GeometryReader(content: { geometry in
                        Color.clear.onAppear(perform: {
                            width = geometry.size.width
                        })
                    })
                }
                .onChange(of: visibleInput) { oldValue, newValue in
                    guard isSecured else { text = newValue; return}
                    if newValue.count >= text.count {
                        let newItem = newValue.filter({ $0 != Character("*")})
                        text.append(newItem)
                    } else {
                        text.removeLast()
                    }
                    
                    visibleInput = String(newValue.map{ _ in Character("*")})
                }
        }
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0, to: 0.55)
                    .stroke(.gray, lineWidth: 1)
                
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                    .stroke(.gray, lineWidth: 1)
                
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 34, height: 34)
                    
                    Spacer()
                    
                    Button {
                        isSecured.toggle()
                        visibleInput = isSecured ? String(text.map{ _ in Character("*") }) : text
                    } label: {
                        Image(systemName: isSecured ? "eye" : "eye.slash").tint(.white)
                    }

                }
                .frame(width: .infinity)
                .padding()
                
                Text(placeHolder)
                    .foregroundColor(.white)
                    .overlay {
                        GeometryReader(content: { geometry in
                            Color.clear.onAppear(perform: {
                                labelWidth = geometry.size.width
                            })
                        })
                    }
                    .padding(2)
                    .font(GilroyFont(isBold: true, size: 13))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: 20, y: -10)
            }
        }
    }
    
}

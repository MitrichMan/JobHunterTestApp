//
//  SignInView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct SignInView: View {
    @State var text = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Spacer()
            VStack {
                ZStack {
                    Color.gray
                    
                    VStack {
                        HStack {
                            Text("Sign In")
                            
                            Spacer()
                        }
                        
                        TextField("Placeholder", text: $text)
                            .textFieldStyle(.roundedBorder)
                        
                        
                        HStack {
                            Button {} label: {
                                HStack {
                                    Spacer()
                                    
                                    Text("Continue")
                                    
                                    Spacer()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            Button {} label: {
                                Text("Enter with password")
                            }
                        }
                    }
                    .padding()
                }
                .cornerRadius(12)
                .padding()
                
                ZStack {
                    Color.gray
                    
                }
                .cornerRadius(12)
                .padding()
            }
        }
    }
}

#Preview {
    SignInView()
}

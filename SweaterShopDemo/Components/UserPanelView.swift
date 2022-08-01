//
//  UserPanelView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 1.08.2022.
//

import SwiftUI

struct UserPanelView: View {
    
    @State var nameText = ""
    @State var emailText = ""
    @State var passwordText = ""
    
    var body: some View {
        ZStack{
            
            Color.orange
                .ignoresSafeArea()
            
            VStack{
                Text("AHESHOP")
                    .font(.largeTitle)
                    .bold()
                    .frame(width: 200, height: 100, alignment: .center)
                    .background(.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Text("a future kind shopping app.")
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                    .font(.caption)
                
                TextField("Please enter your name", text: $nameText)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .padding()
                    
                
                TextField("Please enter your email", text: $emailText)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .padding()
                
                TextField("Please enter your password", text: $passwordText)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .cornerRadius(20)
                    .padding([.top, .leading, .trailing], 10)
                
                HStack{
                    Spacer()
                    Text("forgot password")
                        .bold()
                        .foregroundColor(.white)
                        .italic()
                        .padding(.horizontal)
                        .onTapGesture {
                            //GO to forget password view
                        }
                        
                }
                
                Button {
                    
                } label: {
                    Text("LOGIN")
                        .bold()
                        .font(.title)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding()
                
                Button {
                    
                } label: {
                    Text("INFO")
                        .bold()
                        .font(.title)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        
                }

                
            }
            
            
            
            
        }
    }
}

struct UserPanelView_Previews: PreviewProvider {
    static var previews: some View {
        UserPanelView()
    }
}

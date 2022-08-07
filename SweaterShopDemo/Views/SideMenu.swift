//
//  SideMenu.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 5.08.2022.
//

import SwiftUI
import Firebase

struct Menu: View {
    @ObservedObject var viewModel : AppViewModel
    var body: some View {
        
        VStack {
            
            NavigationLink {
                PokedexView()
            } label: {
                
                HStack(spacing: 15) {
                    
                    Image("pokemon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .font(.title)
                        .foregroundColor(.pink)
                        
                    Text("Info")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }

            
            Spacer()
            
            Button {
                
            } label: {
                HStack(spacing: 15) {
                    
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.title)
                        .foregroundColor(.pink)
                        
                    Text("Log out")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            
            
            
            
            HStack{
                
                Spacer()
                
                Text("Version 0.1")
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
            }
            .padding(10)

        }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}


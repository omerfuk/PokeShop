//
//  ContentView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 140), spacing: 20)]
    
    var body: some View {
        
            
                ZStack{
                    Color("Color1").opacity(0.25).ignoresSafeArea()
                    ScrollView{
                        LazyVGrid(columns: columns,spacing: 20) {
                            ForEach(cartManager.items) { item in
                                
                                NavigationLink {
                                    ItemDetailView(item: item)
                                        .environmentObject(cartManager)
                                } label: {
                                    ProductCard(item: item)
                                        .environmentObject(cartManager)
                                }

                        
                                
                                
                                
                            }
                        }
                        .padding()
                    }
                    .onAppear{
                        
                        cartManager.fetchData()
                    }
                    .navigationTitle("Sweater Shop")
                    .toolbar {
                        NavigationLink {
                            CartView()
                                .environmentObject(cartManager)
                        } label: {
                            CartButton(numberOfProducts: cartManager.itemsOnCart.count)
                        }
                        
                        
                    }
                    
                }
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

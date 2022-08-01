//
//  ContentView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 20) {
                        ForEach(cartManager.items) { item in
                            
                            ProductCard(item: item)
                                .environmentObject(cartManager)
                            
                            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            ScrollView{
                LazyVGrid(columns: columns,spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                        
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Sweater Shop")
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
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

//
//  ProductCard.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import Kingfisher
struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var item: Item
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: item.item_image))
                    .resizable()
                    .cornerRadius(25)
                    .frame(width: 170)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(item.item_title)
                        .bold()
                    
                    Text("\(item.item_price)$")
                        .font(.caption)
                    
                }
                .padding()
                .frame(width: 170, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
            .frame(width: 170, height: 250)
        .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(item: item)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }

        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(item: itemList[0])
            .environmentObject(CartManager())
    }
}

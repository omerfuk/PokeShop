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
                    .frame(width: 140, height: 185)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(item.item_title)
                        .bold()
                    
                    Text("\(item.item_price)$")
                        .font(.caption)
                    
                }
                .padding()
                .frame(width: 150, alignment: .leading)
                .background(.ultraThinMaterial).opacity(0.95)
                .cornerRadius(20)
                
            }
            .frame(width: 150, height: 200)
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
        .background(.cyan.opacity(0.3))
        .cornerRadius(15)
        .shadow(color: .black, radius: 3, x: 2, y: 2)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(item: itemList[0])
            .environmentObject(CartManager())
    }
}

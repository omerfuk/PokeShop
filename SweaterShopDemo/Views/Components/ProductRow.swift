//
//  ProductRow.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import Firebase
import Kingfisher

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var item: Item
    
    var body: some View {
        HStack(spacing: 20) {
            
            KFImage(URL(string: item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(item.item_title)
                    .bold()
                
                Text("$\(ridZero(result:item.item_price))")
                
            }
            
            
            
            
            Button {
               
            } label: {
                Text("-")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .bold()
                    
            }
            
//            Text("\(item.item_count)")
//                .bold()
//                .font(.title)
            
            Button {
                
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .bold()
                    
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding()
                .onTapGesture {
                    cartManager.removeFromCart(item: item)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func ridZero(result: Float) -> String {
            let value = String(format: "%g", result)
            return value
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(item: itemList[0])
            .environmentObject(CartManager())
    }
}

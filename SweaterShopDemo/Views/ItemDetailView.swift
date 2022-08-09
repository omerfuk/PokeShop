//
//  ItemDetailView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 4.08.2022.
//

import SwiftUI
import Kingfisher

struct ItemDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    @State var showAlert = false
    var item: Item
    @State var pokemonName = ""
    @State var charIndex = 0.0
    
    var body: some View {
        ZStack{
            Color("CutePink").ignoresSafeArea()
            VStack(spacing: 20) {
                KFImage(URL(string: item.item_image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 300)
                    .cornerRadius(15)
                
                Text(item.item_title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .offset(y: -50)
                    
                Text(item.item_description)
                    .font(.body)
                    .bold()
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    
                
                Text("Category : \(item.item_category)")
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    
                
                HStack {
                    
                    Text("\(cartManager.calculateTotalPrice())$")
                        .bold()
                        .font(.title)
                        .foregroundColor(Color("Color1"))
                        .padding()
                        .padding(.horizontal)
                        .background(.white.opacity(0.75))
                        .cornerRadius(20)
                    
                    Button {
                        cartManager.addToCart(item: item)
                        showAlert.toggle()
                    } label: {
                        
                        Image(systemName: item.isAdded ? "checkmark" : "cart.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .multilineTextAlignment(.center)
                            .foregroundColor(item.isAdded ? Color.green : Color("Color1"))
                            
                            
                            
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Success"), message: Text("\(item.item_title) Added to Cart"), dismissButton: .destructive(Text("OK")))
                    }
                    
                    
                }
                   Spacer()
            }
            .padding()
            
            
        }
    }
    func ridZero(result: Float) -> String {
            let value = String(format: "%g", result)
            return value
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: itemList[0] )
    }
}

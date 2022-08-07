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
    @State var showAlert: Bool
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .bottom) {
                    KFImage(URL(string: item.item_image))
                        .resizable()
                        .cornerRadius(25)
                        .frame(width: 140, height: 185)
                        .scaledToFit()
                    
                    
                    
                }
                .frame(width: 150, height: 200)
               
                
                
                

            }
            .background(Color("Color3"))
            .padding(10)
            .cornerRadius(15)
            .shadow(color: Color("Color3"), radius: 3, x: 2, y: 2)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("\(item.item_title) Added to Cart"), dismissButton: .destructive(Text("OK")))
        }
            HStack{
                HStack{
                    VStack{
                        Text(item.item_title)
                            .font(.callout)
                            .bold()
                            .shadow(color: .pink, radius: 5, x: 2, y: 2)
                        
                        Text("\(ridZero(result:item.item_price))$")
                            .font(.headline)
                            .shadow(color: .pink, radius: 5, x: 2, y: 2)
                    }
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(item: item)
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color("Color3"))
                            .cornerRadius(50)
                            .padding()
                    }
                    .frame(width: 30, height: 30)
                }
                .padding(7)
                
                
            }
            .padding(4)
            .frame(width: 160,height: 45, alignment: .leading)
            .background(.thickMaterial).opacity(0.95)
            .cornerRadius(20)
            
        }
        .background(Color("LightYellow"))
        .cornerRadius(15)
        
        
    }
    
    func ridZero(result: Float) -> String {
            let value = String(format: "%g", result)
            return value
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(item: itemList[0], showAlert: false)
            .environmentObject(CartManager())
    }
}




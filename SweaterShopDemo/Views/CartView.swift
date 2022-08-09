//
//  CartView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import Kingfisher

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State var showAlert: Bool
    var body: some View {
        VStack{
            
            //this code block is the new product row, product row file is no longer in use.
            ScrollView {
                if cartManager.itemsOnCart.count > 0 {
                    ForEach(cartManager.itemsOnCart) { cart in
                        
                        HStack(spacing: 15) {
                            
                            KFImage(URL(string: cart.item.item_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text(cart.item.item_title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                HStack(spacing: 15) {
                                    Text(cartManager.getPrice(value: Float(cart.item.item_price)))
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button {
                                        if cart.quantity > 1 {
                                            cartManager.itemsOnCart[cartManager.getIndex(item: cart.item, isCartIndex: true)].quantity -= 1
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("\(cart.quantity)")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        
                                    Button {
                                        cartManager.itemsOnCart[cartManager.getIndex(item: cart.item, isCartIndex: true)].quantity += 1
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                    }


                                }
                            }
                        }
                        .padding()
                        .contextMenu{
                            
                            //for deleting
                            
                            Button {
                                //deleting items from cart
                                let index = cartManager.getIndex(item: cart.item, isCartIndex: true)
                                
                                let itemIndex = cartManager.getIndex(item: cart.item, isCartIndex: false)
                                
                                cartManager.items[index].isAdded = false
                                cartManager.filtered[itemIndex].isAdded = false
                                
                                cartManager.itemsOnCart.remove(at: index)
                            } label: {
                                Text("Remove")
                            }

                        }
                        
                    }
                    
                    HStack {
                        Text("Your Cart total is")
                        Spacer()
                        
                        Text("$\(cartManager.calculateTotalPrice()).00")
                            .bold()
                    }
                    .padding()
                    
                    
                    
                    
                }
                else{
                    Text("Your Cart is Empty!")
                        .bold()
                        .foregroundColor(.red)
                }
                
                
            }
            .navigationTitle("My Card")
            .padding(.top)
            
        }
        
        if cartManager.itemsOnCart.count > 0 {
        
        
        Button {
            showAlert.toggle()
            sleep(1)
            cartManager.itemsOnCart.removeAll()
            cartManager.setZeroTotal()
            
        } label: {
            Text("PAY $\(cartManager.calculateTotalPrice()).00")
                .font(.title)
                .bold()
                .padding()
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .foregroundColor(.white)
                .background(Color("Color1"))
                .cornerRadius(15)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("PAYMENT"), message: Text("PAID $\(ridZero(result:cartManager.total)).00 SUCCESSFULLY"), dismissButton: .destructive(Text("OK")))
        }
        
        }
    }
    
    func ridZero(result: Float) -> String {
        let value = String(format: "%g", result)
        return value
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(showAlert: false)
            .environmentObject(CartManager())
    }
}

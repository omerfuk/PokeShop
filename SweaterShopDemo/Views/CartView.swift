//
//  CartView.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State var showAlert: Bool
    var body: some View {
        VStack{
            
            
            ScrollView {
                if cartManager.itemsOnCart.count > 0 {
                    ForEach(cartManager.itemsOnCart) { item in
                        ProductRow(item: item)
                        
                    }
                    
                    HStack {
                        Text("Your Cart total is")
                        Spacer()
                        
                        Text("$\(ridZero(result:cartManager.total)).00")
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
            Text("PAY $\(ridZero(result:cartManager.total)).00")
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

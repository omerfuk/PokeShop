//
//  CartManager.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import Firebase

class CartManager: ObservableObject {
    
    
    @Published var items: [Item] = []
    @Published var total: Float = 0.0
    @Published var filtered: [Item] = []
    @Published var search = ""
    @Published var itemsOnCart: [Cart] = []
    @Published var itemCount = 0
    var alreadyOnCart:Bool = false
    @Published var countCart: Int = 0
   
    
    func fetchData() {
        
        let db = Firestore.firestore()
        
        db.collection("Items").getDocuments { snap, err in
            guard let itemData = snap else {return}
            
            self.items = itemData.documents.compactMap({ doc -> Item? in
                
                
                let title = doc.get("item_title") as? String
                let price = doc.get("item_price") as? NSNumber
                let description = doc.get("item_description") as? String
                let category = doc.get("item_category") as? String
                let image = doc.get("item_image") as? String
                
                return Item(item_title: title ?? "", item_price: Float(price ?? 0.0), item_description: description ?? "", item_category: category ?? "", item_image: image ?? "")
                
                
            })
            self.filtered = self.items
        }
        
    }
    
    func filterData() {
        
        withAnimation(.linear) {
            self.filtered = self.items.filter({
                return $0.item_title.lowercased().contains(self.search.lowercased())
            })
        }
        
    }
    
    func setZeroTotal() {
        total = 0
    }
    
    
    func addToCart(item: Item) {
        
        self.items[getIndex(item: item, isCartIndex: false)].isAdded.toggle()
        //
        let filterIndex = self.filtered.firstIndex { item1 -> Bool in
            return item.id == item1.id
        } ?? 0
        
        self.filtered[filterIndex].isAdded = !item.isAdded
        
        if item.isAdded {
            //removing from list
            
            self.itemsOnCart.remove(at: getIndex(item: item, isCartIndex: true))
            return
        }
        //else adding
      
        
        self.itemsOnCart.append(Cart(item: item, quantity: 1))
        
        
    }
    
    func getIndex(item: Item, isCartIndex: Bool) -> Int {
        
        let index = self.items.firstIndex { item1 -> Bool in
            return item.id == item1.id
        } ?? 0
        
        let cartIndex = self.itemsOnCart.firstIndex { item1 -> Bool in
            return item.id == item1.item.id
        } ?? 0
        
        return isCartIndex ? cartIndex : index
        
    }
    
    func removeFromCart(item: Item) {
        
        guard let index = itemsOnCart.firstIndex(where: { $0.id == item.id }) else{return}
        itemsOnCart.remove(at: index)
        total -= item.item_price
        
//        itemsOnCart = itemsOnCart.filter({ $0.id != item.id})
       
        
        
    }
    
    func calculateTotalPrice() -> String {
        
        
        var price: Float = 0
        
        itemsOnCart.forEach { item in
            price += Float(item.quantity) * Float(item.item.item_price)
        }
        return getPrice(value: price)
    }
    
    func getPrice(value: Float) -> String {
        
        let format = NumberFormatter()
        format.numberStyle = .currency
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    
}

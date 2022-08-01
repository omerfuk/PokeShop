//
//  CartManager.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI
import Firebase

class CartManager: ObservableObject {
    
    
    @Published private (set) var items: [Item] = []
    @Published private (set) var total: Float = 0.0
    @Published var filtered: [Item] = []
    @Published var search = ""
    @Published var itemsOnCart: [Item] = []
    
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
    
    
    func addToCart(item: Item) {
        
        countCart += 1
        
        print(countCart)
        itemsOnCart.append(item)
        total += item.item_price
        
    }
    
    func removeFromCart(item: Item) {
        countCart -= 1
        print(countCart)
        
        itemsOnCart = itemsOnCart.filter({ $0.id != item.id})
        total -= item.item_price
    }
    
    
}

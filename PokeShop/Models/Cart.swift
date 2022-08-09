//
//  Cart.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 8.08.2022.
//

import Foundation

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
    
}

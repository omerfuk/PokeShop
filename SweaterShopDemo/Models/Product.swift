//
//  Product.swift
//  SweaterShopDemo
//
//  Created by Ömer Faruk Kılıçaslan on 31.07.2022.
//

import SwiftUI

struct Product: Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    
}

var productList = [
    
    Product(name: "Orange Sweater", image: "sweater2", price: 54),
    Product(name: "White Sweater", image: "sweater3", price: 55),
    Product(name: "Orange Sweater", image: "sweater4", price: 64),
    Product(name: "Orange Sweater", image: "sweater5", price: 58),
    Product(name: "Orange Sweater", image: "sweater6", price: 94),
    Product(name: "Orange Sweater", image: "sweater7", price: 34),
    Product(name: "Orange Sweater", image: "sweater8", price: 41)

]

//
//  CartItem.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 09/05/26.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

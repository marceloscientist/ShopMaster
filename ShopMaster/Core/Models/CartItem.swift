//
//  CartItem.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 09/05/26.
//

import Foundation

struct CartItem: Identifiable, Codable {

    let id: UUID
    let product: Product
    var quantity: Int

    init(id: UUID = UUID(), product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}

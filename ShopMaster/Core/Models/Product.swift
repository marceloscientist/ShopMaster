//
//  Product.swift
//  ShopMaster
//
//  Created by Santana, Marcelo de Carvalho on 09/05/26.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Double
}

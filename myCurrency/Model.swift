//
//  Model.swift
//  myCurrency
//
//  Created by Dima on 25/05/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

import Foundation

struct Valute: Decodable {
    let usd, eur, lkr, sgd, byn, pln, inr, kzt: TypeCurrency
}

struct TypeCurrency: Decodable {
    
    let alphaCode: String
    let name: String
    let inverseRate: Double
    
}


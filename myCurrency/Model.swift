//
//  Model.swift
//  myCurrency
//
//  Created by Dima on 25/05/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

import Foundation

struct DailyCurrency: Decodable {
    
    let valute: Valute
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        valute = try container.decode(Valute.self, forKey: .valute)
    }
}

struct Valute: Decodable {
    
    let usd, eur, sgd: TypeCurrency
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case sgd = "SGD"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        usd = try container.decode(TypeCurrency.self, forKey: .usd)
        eur = try container.decode(TypeCurrency.self, forKey: .eur)
        sgd = try container.decode(TypeCurrency.self, forKey: .sgd)
    }
    
}

struct TypeCurrency: Decodable {
    
    let charCode: String
    let nominal: Int
    let name: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        charCode = try container.decode(String.self, forKey: .charCode)
        nominal = try container.decode(Int.self, forKey: .nominal)
        name = try container.decode(String.self, forKey: .name)
        value = try container.decode(Double.self, forKey: .value)
    }
    
}


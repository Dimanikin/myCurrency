//
//  Model.swift
//  myCurrency
//
//  Created by Dima on 25/05/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

import Foundation

struct DailyCurrency: Decodable {
    //    let Date: String
    //    let PreviousDate: String
    //    let PreviousURL: String
    //    let Timestamp: String
    let Valute: Valute
}

struct Valute: Decodable {
    let USD, EUR, SGD: TypeCurrency
}

struct TypeCurrency: Decodable {
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
}


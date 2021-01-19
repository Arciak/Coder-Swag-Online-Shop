//
//  DataService.swift
//  coder-swag-online-shop
//
//  Created by Artur Zarzecki on 19/01/2021.
//  Copyright © 2021 Artur Zarzecki. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService() //tworzymy singleton, on wskazuje a mejsce w pamięci które nie bedize zmieniane
    //singleton pzwala korzytsac w kolko z tego samego, oszczdza miejsce w pamieci
    // tworzymy nasze źródło danych
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"), // tworzymy dwie kopie struct i trzyma w 2 miejscach w pamięci, singleton zajmuje tylko 1 miejsce w pamięci
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    func getCategories() -> [Category]{ // zwraca tablice Category, taka tablica jak categories
        return categories
    }
}

//
//  Category.swift
//  coder-swag-online-shop
//
//  Created by Artur Zarzecki on 19/01/2021.
//  Copyright © 2021 Artur Zarzecki. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String // puliczne dla pobrania nazwy ale prywatne na nadwanie nazwy
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

//
//  Item.swift
//  Item
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title : String
    var price : String
    var subTitle : String
    var image : String
    var offset : CGFloat = 0
}


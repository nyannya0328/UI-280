//
//  Meeting.swift
//  Meeting
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

struct Meeting: Identifiable {
    var id = UUID().uuidString
    var title : String
    var timing : Date
    var cardColor : Color = Color("Blue")
    var turendOn : Bool = true
    var membertypist = "Public"
    var members : [String] = Array(repeating: "", count: 10)
}



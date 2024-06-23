//
//  Rules.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 22/06/2024.
//

import Foundation
import SwiftUI

struct Rule : Identifiable {
    var id = UUID()
    let title: String
    let descritpion: String
}


var rules : [Rule] = [
    Rule(title: "Winning too much", descritpion: "")

]

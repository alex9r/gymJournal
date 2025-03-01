//
//  Item.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import Foundation
import SwiftData

//@Model
//final class Item {
//    var timestamp: Date
//    
//    init(timestamp: Date) {
//        self.timestamp = timestamp
//    }
//}

struct Item<Destination: View>: Identifiable {
    let id = UUID()
    let title: String
    let destination: Destination
}

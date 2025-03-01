//
//  Item.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import Foundation
import SwiftData
import SwiftUICore

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}

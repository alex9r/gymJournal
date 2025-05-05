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
    let imageName: String?
    let destination: AnyView

    init(title: String, imageName: String? = nil, destination: AnyView) {
        self.title = title
        self.imageName = imageName
        self.destination = destination
    }
}

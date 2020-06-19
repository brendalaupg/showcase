//
//  MenuItem.swift
//  showcase-ios
//
//  Created by Brenda Lau on 18/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import Foundation

struct MenuItem: Codable, Hashable {
    public var title: String
    public var description: String?

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(description)
    }
}

extension MenuItem {
    static func sampleData() -> [MenuItem] {
        [
            MenuItem(title: "Custom Flow Layouts", description: nil),
            MenuItem(title: "Compositional Layouts", description: nil)
        ]
    }
}

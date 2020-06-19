//
//  Showcase.swift
//  showcase-ios
//
//  Created by Brenda Lau on 19/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import Foundation

struct Showcase: Codable, Hashable {
    var title: String
    var photoName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(photoName)
    }
}

extension Showcase {
    static func sampleData() -> [Showcase] {
        [
            Showcase(title: "Flower 0", photoName: "flower0"),
            Showcase(title: "Flower 1", photoName: "flower1"),
            Showcase(title: "Flower 2", photoName: "flower2"),
            Showcase(title: "Flower 3", photoName: "flower3"),
            Showcase(title: "Flower 4", photoName: "flower4"),
            Showcase(title: "Flower 5", photoName: "flower5"),
            Showcase(title: "Flower 6", photoName: "flower6"),
            Showcase(title: "Flower 7", photoName: "flower7"),
            Showcase(title: "Flower 8", photoName: "flower8"),
            Showcase(title: "Flower 9", photoName: "flower9")
        ]
    }
}

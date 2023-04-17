//
//  Cat.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 16/04/23.
//

import Foundation

public struct Cat {
    let breedName: String
    let origin: String
    let affectionLevel: Int
    let intelligence: Int
    let imageURL: String
}

extension Cat: Decodable {
    private enum CodingKeys: String, CodingKey {
        case breedName = "name"
        case origin
        case affectionLevel = "affection_level"
        case intelligence
        case imageURL = "reference_image_id"
    }
}

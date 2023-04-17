//
//  CatInformationLoader.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 16/04/23.
//

import Foundation

public enum LoadCatInformationResult {
    case success([Cat])
    case failure(Error)
}

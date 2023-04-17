//
//  ViewModelCat.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 16/04/23.
//

import Foundation
import UIKit.UIImage

public class ViewModelCat {
    public var cats: [Cat]
    
    let breedName = Box(" ")
    let origin = Box(" ")
    let affectionLevel = Box(0)
    let intelligence = Box(0)
    let image: Box<UIImage?> = Box(nil)
    
    public init(){
        self.cats = [Cat]()
        self.getCats()
    }
    
    public func getCats() {
        CatServices().load { [weak self] catsResult in
            guard self != nil else { return }
            switch catsResult {
            case let .success(catsInfo):
                self?.cats = catsInfo
                self?.breedName.value = catsInfo[1].breedName
                self?.origin.value = catsInfo[1].origin
                self?.affectionLevel.value = catsInfo[1].affectionLevel
                self?.intelligence.value = catsInfo[1].intelligence
                self?.image.value = UIImage(named: catsInfo[1].imageURL)
            case .failure:
                print("error")
            }
        }
    }
}

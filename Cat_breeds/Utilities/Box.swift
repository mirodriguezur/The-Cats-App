//
//  Box.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 17/04/23.
//

import Foundation

final class Box<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?
  var value: T {
    didSet {
      listener?(value)
    }
  }
  init(_ value: T) {
    self.value = value
  }
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

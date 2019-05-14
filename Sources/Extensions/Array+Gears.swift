//
//  Array+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/13/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension Array {
    public func `as`<T>(_ type: T.Type) -> [T] {
        return compactMap { ($0 as? T) }
    }

    public subscript(index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

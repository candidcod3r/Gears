//
//  Array+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/13/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension Array {
    /**
     Returns an array of elements which confirm to the given type
     */
    public func `as`<T>(_ type: T.Type) -> [T] {
        return compactMap { ($0 as? T) }
    }

    /**
     Access unsafe subscript index of the array to return optional element
     */
    public subscript(unsafe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}

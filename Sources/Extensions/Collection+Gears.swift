//
//  Collection+Gears.swift
//  Alamofire
//
//  Created by Candid Cod3r on 5/18/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

/**
 To have type erasure for Swift.Optional
 */
public protocol _Optional {
    associatedtype _Wrapped

    func flatMap<U>(_ transform: (_Wrapped) throws -> U?) rethrows -> U?
}

extension Optional: _Optional {
    public typealias _Wrapped = Wrapped
}

extension Collection where Iterator.Element: _Optional {
    /**
     Returns an array containing non optional elements
     */
    public func compacted() -> [Iterator.Element._Wrapped] {
        return self.compactMap { $0.flatMap { $0 } }
    }
}

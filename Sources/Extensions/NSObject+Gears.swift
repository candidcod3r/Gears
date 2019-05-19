//
//  NSObject+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/18/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension NSObject {
    func getObject<T: Any>(for key: UnsafeRawPointer) -> T? {
        let object = objc_getAssociatedObject(self, key) as? T
        return object
    }

    func setObject<T: Any>(_ value: T?, for key: UnsafeRawPointer) {
        objc_setAssociatedObject(
            self,
            key,
            value,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

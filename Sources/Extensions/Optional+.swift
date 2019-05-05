//
//  Optional+.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

infix operator =>
extension Optional {
    public static func =>(_ optional: Optional, _ block: (Wrapped) -> Void) {
        guard let value = optional else {
            return
        }
        block(value)
    }

    public static func =><T>(_ optional: Optional, _ block: (Wrapped) -> T) -> T? {
        guard let value = optional else {
            return nil
        }
        return block(value)
    }
}

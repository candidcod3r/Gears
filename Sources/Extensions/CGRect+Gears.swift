//
//  CGRec+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGRect {

    public var top: CGFloat {
        get {
            return origin.y
        }
        set {
            origin.y = newValue
        }
    }

    public var left: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }

    public var bottom: CGFloat {
        get {
            return top + height
        }
        set {
            top = newValue - height
        }
    }

    public var right: CGFloat {
        get {
            return left + width
        }
        set {
            left = newValue - width
        }
    }

    public var center: CGPoint {
        get {
            return CGPoint(x: minX + width/2, y: minY + height/2)
        }
        set(newValue) {
            origin.x = newValue.x - width/2
            origin.y = newValue.y - height/2
        }
    }
}

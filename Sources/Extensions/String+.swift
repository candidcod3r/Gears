//
//  String+.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Regex {
    // http://phoneregex.com/
    public static let phone = "\\s*(?<areacode>^[1-9][0-8][0-9])(?<separator>\\W?)(?<exchangecode>[1-9][0-9]{2})\\k<separator>(?<linecode>[0-9]{4}\\s*$)"
}

extension String {
    public var asURL: URL? {
        return URL(string: self)
    }

    public subscript(_ nsrange: NSRange) -> String {
        guard let range = Range(nsrange, in: self) else {
            return ""
        }
        let substring = self[range]
        return String(substring)
    }
}

// MARK: Formatting utils
extension String {
    public var isPhoneNumber: Bool {
        return range(of: Regex.phone, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

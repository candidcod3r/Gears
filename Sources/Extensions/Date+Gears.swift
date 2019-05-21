//
//  Date+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/20/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

// MARK: - Computed variables

extension Date {

    /**
     Era from this date using current calendar.
     */
    public var era: Int {
        return Calendar.current.component(.era, from: self)
    }

    /**
     Quarter from this date using current calendar.
     */
    public var quarter: Int {
        let month = Double(Calendar.current.component(.month, from: self))
        let numberOfMonths = Double(Calendar.current.monthSymbols.count)
        let numberOfMonthsInQuarter = numberOfMonths / 4
        return Int(ceil(month/numberOfMonthsInQuarter))
    }

    /**
     Week of the year from this date using current calendar.
     */
    public var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }

    /**
     Week of the month from this date using current calendar.
     */
    public var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }

    /**
     Returns true if date is in future or else false.
     */
    public var isInFuture: Bool {
        return self > Date()
    }

    /**
     Returns true if date is in past or else false.
     */
    public var isInPast: Bool {
        return self < Date()
    }

    /**
     Returns true if date is in today or else false.
     */
    public var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    /**
     Returns true if date is in yesterday or else false.
     */
    public var isInYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }

    /**
     Returns true if date is in tomorrow or else false.
     */
    public var isInTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }

    /**
     Yesterday based on this date.
     */
    public var yesterday: Date {
        return addingTimeInterval(-86400.0)
    }

    /**
     Tomorrow based on this date.
     */
    public var tomorrow: Date {
        return addingTimeInterval(86400.0)
    }

    /**
     Return unix time stamp.
     */
    public var unixTimestamp: Double {
        return timeIntervalSince1970
    }
}

// MARK: - Getters and Setters for components.

extension Date {
    /**
     Getter and Setter for year.
     */
    public var year: Int {
        get {
            return Calendar.current.component(.year, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .year)
        }
    }

    /**
     Getter and Setter for month.
     */
    public var month: Int {
        get {
            return Calendar.current.component(.month, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .month)
        }
    }


    /**
     Getter and Setter for day.
     */
    public var day: Int {
        get {
            return Calendar.current.component(.day, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .day)
        }
    }

    /**
     Getter and Setter for hour.
     */
    public var hour: Int {
        get {
            return Calendar.current.component(.hour, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .hour)
        }
    }

    /**
     Getter and Setter for minute.
     */
    public var minute: Int {
        get {
            return Calendar.current.component(.minute, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .minute)
        }
    }

    /**
     Getter and Setter for second.
     */
    public var second: Int {
        get {
            return Calendar.current.component(.second, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .second)
        }
    }

    /**
     Getter and Setter for nanosecond.
     */
    public var nanosecond: Int {
        get {
            return Calendar.current.component(.nanosecond, from: self)
        }
        set {
            checkAndUpdate(value: newValue, for: .nanosecond)
        }
    }

    /**
     Getter and Setter for millisecond.
     */
    public var millisecond: Int {
        get {
            return Calendar.current.component(.nanosecond, from: self) / 1000000
        }
        set {
            let nanoSeconds = newValue * 1000000
            checkAndUpdate(value: newValue, for: .nanosecond)
        }
    }

    /**
     Check for valid range of value for component.
     */
    private func checkForValidRange(of value: Int, for component: Calendar.Component) -> Bool {
        guard let nextLargerComponent = component.nextLarger else {
            return false
        }

        guard let allowedRange = Calendar.current.range(of: component, in: nextLargerComponent, for: self) else {
            return false
        }

        guard allowedRange.contains(value) else {
            return false
        }

        return true
    }

    /**
     Check for constraints on given value and update the self.
     */
    private mutating func checkAndUpdate(value: Int, for component: Calendar.Component) {
        guard checkForValidRange(of: value, for: component) else {
            return
        }

        let currentValue = Calendar.current.component(component, from: self)
        let valueToAdd = value - currentValue

        add(valueToAdd, for: component)
    }

    /**
     Add value for component if valid.
     */
    public mutating func add(_ value: Int, for component: Calendar.Component) {
        guard let date = Calendar.current.date(byAdding: component, value: value, to: self) else {
            return
        }
        self = date
    }
}

// MARK: - Useful methods

extension Date {

    /**
     Formatted date time string with given format string.
     */
    public func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    /**
     Formatted date time string with given date and time style.
     */
    public func string(withDateStyle dateStyle: DateFormatter.Style = .medium, withTimeStyle timeStyle: DateFormatter.Style = .short) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }

    /**
     Returns true if date is in component granularity or else false.
     */
    public func isInCurrent(_ component: Calendar.Component) -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: component)
    }

    /**
     Returns seconds difference between dates.
     */
    public func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }

    /**
     Returns minutes difference between dates.
     */
    func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/60
    }

    /**
     Returns hours difference between dates.
     */
    func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/3600
    }

    /**
     Returns days difference between dates.
     */
    func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/(3600*24)
    }

}

// MARK: - Initializers

public extension Date {

    /**
     Create a new date form calendar components.
     */
    public init?(calendar: Calendar? = Calendar.current,
                 timeZone: TimeZone? = NSTimeZone.default,
                 era: Int? = Date().era,
                 year: Int? = Date().year,
                 month: Int? = Date().month,
                 day: Int? = Date().day,
                 hour: Int? = Date().hour,
                 minute: Int? = Date().minute,
                 second: Int? = Date().second,
                 nanosecond: Int? = Date().nanosecond) {
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond

        guard let date = calendar?.date(from: components) else {
            return nil
        }

        self = date
    }

    /**
     Convenience initialier with UNIX timestamp.
     */
    public init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }

}

extension Calendar.Component {
    var nextLarger: Calendar.Component? {
        switch self {
        case .year:
            return .era
        case .month:
            return .year
        case .day:
            return .month
        case .hour:
            return .day
        case .minute:
            return .hour
        case .second:
            return .minute
        case .nanosecond:
            return .second
        default:
            return nil
        }
    }
}

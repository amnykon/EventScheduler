import Foundation

public struct Scheduler {
    private var events = MutableSchedule()
    private var moment: Double = 0.0

    mutating public func changeMoment(by duration: Double) {
        moment = moment + duration
    }

    public var schedule: Schedule {
        return events.schedule
    }

    public func add(event: Event, duration: Double) {
        events.add(event: event, start: moment, duration: duration)
    }

    public init() {}
}

import Foundation

class MutableSchedule {
    private var events: [ScheduledEvent] = []

    func add(event: Event, start: Double, duration: Double) {
        events.append(ScheduledEvent(event: event, start: start, duration: duration))
    }

    var schedule: Schedule {
        return Schedule(events: events)
    }
}

import Foundation

public struct Schedule {
    private var events: [ScheduledEvent] = []

    init(events: [ScheduledEvent]) {
        self.events = events
    }

    var start: Double {
        return events.reduce(Double.infinity, {min($0, $1.start)})
    }

    var stop: Double {
        return events.reduce(-Double.infinity, {max($0, $1.stop)})
    }

    func step(from lastStep: Double, to currentStep: Double) {
        for event in events {
            event.step(from: lastStep, to: currentStep)
        }
    }
}

import Foundation

struct ScheduledEvent {
    private let event: Event
    let start: Double
    private let duration: Double
    var stop: Double {
        return start + duration
    }

    init(event: Event, start: Double, duration: Double) {
        self.event = event
        self.start = start
        self.duration = duration
    }

    func step(from prevStep: Double, to step: Double) {
        if prevStep < step {
            if prevStep >= stop {
                return
            }
            if step < start {
                return
            }
            if prevStep < start {
                event.startEvent()
            }
            if step >= stop {
                event.stepEvent(progress: 1.0)
                event.stopEvent()
                return
            }
            let progress = (step - start)/duration

            event.stepEvent(progress: progress)
        } else if prevStep > step {
            if step >= stop {
                return
            }
            if prevStep < start {
                return
            }
            if prevStep >= stop {
                event.restartEvent()
            }
            if step < start {
                event.stepEvent(progress: 0.0)
                event.cancelEvent()
                return
            }
            let progress = (step - start)/duration

            event.stepEvent(progress: progress)
        }
    }
}

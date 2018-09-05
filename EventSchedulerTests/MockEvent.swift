import EventScheduler

class MockEvent: Event {
    var progress: Double? = nil
    func stepEvent(progress: Double) {
        self.progress = progress
    }

    var started = false
    func startEvent() {
        started = true
    }

    var stopped = false
    func stopEvent() {
        stopped = true
    }

    var restarted = false
    func restartEvent() {
        restarted = true
    }

    var canceled = false
    func cancelEvent() {
        canceled = true
    }

    func reset() {
        progress = nil
        started = false
        stopped = false
        restarted = false
        canceled = false
    }
}

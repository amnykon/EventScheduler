import Foundation

public class RunningSchedule: Hashable {
    private let start: Date
    private var lastStep: Double
    private let schedule: Schedule
    private weak var runner: ScheduleRunner?

    init(schedule: Schedule, at start: Date, runner: ScheduleRunner) {
        self.lastStep = -Double.infinity
        self.schedule = schedule
        self.start = start.addingTimeInterval(-schedule.start)
        self.runner = runner
    }

    func step(date: Date) {
        let currentStep: Double = date.timeIntervalSince(start)

        schedule.step(from: lastStep, to: currentStep)

        lastStep = currentStep
    }

    var hasFinished: Bool {
        return lastStep >= schedule.stop
    }

    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }

    public static func == (lhs: RunningSchedule, rhs: RunningSchedule) -> Bool {
        return lhs === rhs
    }

    public func abort() {
        runner?.abort(runningSchedule: self)
    }

    public func complete() {
        runner?.complete(runningSchedule: self)
    }

    public func cancel() {
        runner?.cancel(runningSchedule: self)
    }
}

import Foundation

public class ScheduleRunner {
    public static var shared = ScheduleRunner()
    private var schedules: Set<RunningSchedule> = Set()

    @discardableResult public func start(schedule: Schedule, at start: Date = Date()) -> RunningSchedule {
        let runningSchedule = RunningSchedule(schedule: schedule, at: start, runner: self)
        schedules.insert(runningSchedule)
        return runningSchedule
    }

    public func step(date: Date = Date()) {
        for schedule in schedules {
            schedule.step(date: date)
        }
        schedules = schedules.filter{!$0.hasFinished}
    }

    func abort(runningSchedule:RunningSchedule) {
        schedules.remove(runningSchedule)
    }

    func complete(runningSchedule:RunningSchedule) {
        guard schedules.contains(runningSchedule) else {
            return
        }
        runningSchedule.step(date: Date.distantFuture)
        schedules.remove(runningSchedule)
    }

    func cancel(runningSchedule:RunningSchedule) {
        guard schedules.contains(runningSchedule) else {
            return
        }
        runningSchedule.step(date: Date.distantPast)
        schedules.remove(runningSchedule)
    }
}

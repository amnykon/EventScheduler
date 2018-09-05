import XCTest
import EventScheduler

class EventSchedulerTests: XCTestCase {

    func testRunScheduleWithSingleEvent() {
        let date = Date()
        let scheduler = Scheduler()
        let event = MockEvent()
        let event2 = MockEvent()
        scheduler.add(event: event, duration: 5)
        scheduler.add(event: event2, duration: 10)
        ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date)
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(-1))
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertEqual(event.progress, 0.0/5.0)
        XCTAssertTrue(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(1))
        XCTAssertEqual(event.progress, 1.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(2))
        XCTAssertEqual(event.progress, 2.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(3))
        XCTAssertEqual(event.progress, 3.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(4))
        XCTAssertEqual(event.progress, 4.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertEqual(event.progress, 5.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertTrue(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(6))

        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(4))
        XCTAssertEqual(event.progress, 4.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertTrue(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(3))
        XCTAssertEqual(event.progress, 3.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(2))
        XCTAssertEqual(event.progress, 2.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(1))
        XCTAssertEqual(event.progress, 1.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertEqual(event.progress, 0.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(-1))
        XCTAssertEqual(event.progress, 0.0/5.0)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertTrue(event.canceled)
    }

    func testRunScheduleWithSingleInstantEvent() {
        let date = Date()
        let scheduler = Scheduler()
        let event = MockEvent()
        scheduler.add(event: event, duration: 0)
        ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date)
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(-1))
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertEqual(event.progress, 1.0)
        XCTAssertTrue(event.started)
        XCTAssertTrue(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)

        event.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(1))
        XCTAssertNil(event.progress)
        XCTAssertFalse(event.started)
        XCTAssertFalse(event.stopped)
        XCTAssertFalse(event.restarted)
        XCTAssertFalse(event.canceled)
    }

    func testEventIsRemovedFromRunnerWhenComplete() {
        let date = Date()
        weak var event: MockEvent? = nil

        autoreleasepool {
            let scheduler = Scheduler()
            let mockEvent = MockEvent()
            event = mockEvent
            scheduler.add(event: mockEvent, duration: 5)
            ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date)
        }
        XCTAssertNotNil(event)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertNotNil(event)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertNil(event)
    }

    func testRunScheduleWithTwoEvents() {
        let date = Date()
        var scheduler = Scheduler()
        let event1 = MockEvent()
        let event2 = MockEvent()
        scheduler.changeMoment(by: -1.0)
        scheduler.add(event: event1, duration: 5)
        scheduler.changeMoment(by: 2.0)
        scheduler.add(event: event2, duration: 6)
        ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date)
        XCTAssertNil(event1.progress)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertNil(event2.progress)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertEqual(event1.progress, 0.0/5.0)
        XCTAssertTrue(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertNil(event2.progress)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(2))
        XCTAssertEqual(event1.progress, 2.0/5.0)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 0.0/6.0)
        XCTAssertTrue(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertEqual(event1.progress, 5.0/5.0)
        XCTAssertFalse(event1.started)
        XCTAssertTrue(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 3.0/6.0)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(8))
        XCTAssertNil(event1.progress)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 6.0/6.0)
        XCTAssertFalse(event2.started)
        XCTAssertTrue(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)
    }

    func testRunTwoScheduleWithSingleEvent() {
        let date = Date()
        let scheduler1 = Scheduler()
        let event1 = MockEvent()
        let scheduler2 = Scheduler()
        let event2 = MockEvent()
        scheduler1.add(event: event1, duration: 5)
        scheduler2.add(event: event2, duration: 6)
        ScheduleRunner.shared.start(schedule: scheduler1.schedule, at: date.addingTimeInterval(0))
        ScheduleRunner.shared.start(schedule: scheduler2.schedule, at: date.addingTimeInterval(2))
        XCTAssertNil(event1.progress)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertNil(event2.progress)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertEqual(event1.progress, 0.0/5.0)
        XCTAssertTrue(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertNil(event2.progress)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(2))
        XCTAssertEqual(event1.progress, 2.0/5.0)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 0.0/6.0)
        XCTAssertTrue(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertEqual(event1.progress, 5.0/5.0)
        XCTAssertFalse(event1.started)
        XCTAssertTrue(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 3.0/6.0)
        XCTAssertFalse(event2.started)
        XCTAssertFalse(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)

        event1.reset()
        event2.reset()
        ScheduleRunner.shared.step(date: date.addingTimeInterval(8))
        XCTAssertNil(event1.progress)
        XCTAssertFalse(event1.started)
        XCTAssertFalse(event1.stopped)
        XCTAssertFalse(event1.restarted)
        XCTAssertFalse(event1.canceled)

        XCTAssertEqual(event2.progress, 6.0/6.0)
        XCTAssertFalse(event2.started)
        XCTAssertTrue(event2.stopped)
        XCTAssertFalse(event2.restarted)
        XCTAssertFalse(event2.canceled)
    }

    func testTwoSchedulesAreRemovedFromRunnerWhenComplete() {
        let date = Date()
        weak var event1: MockEvent? = nil
        weak var event2: MockEvent? = nil

        autoreleasepool {
            let scheduler1 = Scheduler()
            let mockEvent1 = MockEvent()
            event1 = mockEvent1
            scheduler1.add(event: mockEvent1, duration: 5)
            ScheduleRunner.shared.start(schedule: scheduler1.schedule, at: date.addingTimeInterval(0))

            let scheduler2 = Scheduler()
            let mockEvent2 = MockEvent()
            event2 = mockEvent2
            scheduler2.add(event: mockEvent2, duration: 6)
            ScheduleRunner.shared.start(schedule: scheduler2.schedule, at: date.addingTimeInterval(2))
        }
        XCTAssertNotNil(event1)
        XCTAssertNotNil(event2)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(0))
        XCTAssertNotNil(event1)
        XCTAssertNotNil(event2)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(2))
        XCTAssertNotNil(event1)
        XCTAssertNotNil(event2)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(5))
        XCTAssertNil(event1)
        XCTAssertNotNil(event2)

        ScheduleRunner.shared.step(date: date.addingTimeInterval(8))
        XCTAssertNil(event1)
        XCTAssertNil(event2)
    }

    func testAbortRunningSchedule() {
        let date = Date()
        weak var event1: MockEvent? = nil
        weak var event2: MockEvent? = nil
        weak var event3: MockEvent? = nil

        weak var runningSchedule: RunningSchedule? = nil
        autoreleasepool {
            var scheduler = Scheduler()
            let mockEvent1 = MockEvent()
            event1 = mockEvent1
            scheduler.add(event: mockEvent1, duration: 0)

            let mockEvent2 = MockEvent()
            event2 = mockEvent2
            scheduler.add(event: mockEvent2, duration: 1)

            let mockEvent3 = MockEvent()
            event3 = mockEvent3
            scheduler.changeMoment(by: 1)
            scheduler.add(event: mockEvent3, duration: 1)

            runningSchedule = ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date.addingTimeInterval(0))

            ScheduleRunner.shared.step(date: date.addingTimeInterval(0))

            mockEvent1.reset()
            mockEvent2.reset()
            mockEvent3.reset()
            runningSchedule?.abort()
            XCTAssertNil(mockEvent1.progress)
            XCTAssertFalse(mockEvent1.started)
            XCTAssertFalse(mockEvent1.stopped)
            XCTAssertFalse(mockEvent1.restarted)
            XCTAssertFalse(mockEvent1.canceled)

            XCTAssertNil(mockEvent2.progress)
            XCTAssertFalse(mockEvent2.started)
            XCTAssertFalse(mockEvent2.stopped)
            XCTAssertFalse(mockEvent2.restarted)
            XCTAssertFalse(mockEvent2.canceled)

            XCTAssertNil(mockEvent3.progress)
            XCTAssertFalse(mockEvent3.started)
            XCTAssertFalse(mockEvent3.stopped)
            XCTAssertFalse(mockEvent3.restarted)
            XCTAssertFalse(mockEvent3.canceled)
        }
        XCTAssertNil(runningSchedule)
        XCTAssertNil(event1)
        XCTAssertNil(event2)
        XCTAssertNil(event3)
    }

    func testCompleteRunningSchedule() {
        let date = Date()
        weak var event1: MockEvent? = nil
        weak var event2: MockEvent? = nil
        weak var event3: MockEvent? = nil

        weak var runningSchedule: RunningSchedule? = nil
        autoreleasepool {
            var scheduler = Scheduler()
            let mockEvent1 = MockEvent()
            event1 = mockEvent1
            scheduler.add(event: mockEvent1, duration: 0)

            let mockEvent2 = MockEvent()
            event2 = mockEvent2
            scheduler.add(event: mockEvent2, duration: 1)

            let mockEvent3 = MockEvent()
            event3 = mockEvent3
            scheduler.changeMoment(by: 1)
            scheduler.add(event: mockEvent3, duration: 1)

            runningSchedule = ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date.addingTimeInterval(0))

            ScheduleRunner.shared.step(date: date.addingTimeInterval(0))

            mockEvent1.reset()
            mockEvent2.reset()
            mockEvent3.reset()
            runningSchedule?.complete()
            ScheduleRunner.shared.step(date: date.addingTimeInterval(1))
            XCTAssertNil(mockEvent1.progress)
            XCTAssertFalse(mockEvent1.started)
            XCTAssertFalse(mockEvent1.stopped)
            XCTAssertFalse(mockEvent1.restarted)
            XCTAssertFalse(mockEvent1.canceled)

            XCTAssertEqual(mockEvent2.progress, 1.0)
            XCTAssertFalse(mockEvent2.started)
            XCTAssertTrue(mockEvent2.stopped)
            XCTAssertFalse(mockEvent2.restarted)
            XCTAssertFalse(mockEvent2.canceled)

            XCTAssertEqual(mockEvent3.progress, 1.0)
            XCTAssertTrue(mockEvent3.started)
            XCTAssertTrue(mockEvent3.stopped)
            XCTAssertFalse(mockEvent3.restarted)
            XCTAssertFalse(mockEvent3.canceled)
        }
        XCTAssertNil(runningSchedule)
        XCTAssertNil(event1)
        XCTAssertNil(event2)
        XCTAssertNil(event3)
    }

    func testCancelRunningSchedule() {
        let date = Date()
        weak var event1: MockEvent? = nil
        weak var event2: MockEvent? = nil
        weak var event3: MockEvent? = nil

        weak var runningSchedule: RunningSchedule? = nil
        autoreleasepool {
            var scheduler = Scheduler()
            let mockEvent1 = MockEvent()
            event1 = mockEvent1
            scheduler.add(event: mockEvent1, duration: 0)

            let mockEvent2 = MockEvent()
            event2 = mockEvent2
            scheduler.add(event: mockEvent2, duration: 1)

            let mockEvent3 = MockEvent()
            event3 = mockEvent3
            scheduler.changeMoment(by: 1)
            scheduler.add(event: mockEvent3, duration: 1)

            runningSchedule = ScheduleRunner.shared.start(schedule: scheduler.schedule, at: date.addingTimeInterval(0))

            ScheduleRunner.shared.step(date: date.addingTimeInterval(1))

            mockEvent1.reset()
            mockEvent2.reset()
            mockEvent3.reset()
            runningSchedule?.cancel()
            XCTAssertEqual(mockEvent1.progress, 0.0)
            XCTAssertFalse(mockEvent1.started)
            XCTAssertFalse(mockEvent1.stopped)
            XCTAssertTrue(mockEvent1.restarted)
            XCTAssertTrue(mockEvent1.canceled)

            XCTAssertEqual(mockEvent2.progress, 0.0)
            XCTAssertFalse(mockEvent2.started)
            XCTAssertFalse(mockEvent2.stopped)
            XCTAssertTrue(mockEvent2.restarted)
            XCTAssertTrue(mockEvent2.canceled)

            XCTAssertEqual(mockEvent3.progress, 0.0)
            XCTAssertFalse(mockEvent3.started)
            XCTAssertFalse(mockEvent3.stopped)
            XCTAssertFalse(mockEvent3.restarted)
            XCTAssertTrue(mockEvent3.canceled)
        }
        XCTAssertNil(runningSchedule)
        XCTAssertNil(event1)
        XCTAssertNil(event2)
        XCTAssertNil(event3)
    }

}

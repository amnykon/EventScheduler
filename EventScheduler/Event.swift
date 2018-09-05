import Foundation

public protocol Event {
    func startEvent()
    func stepEvent(progress: Double)
    func stopEvent()
    func restartEvent()
    func cancelEvent()
}

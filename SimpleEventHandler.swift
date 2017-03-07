import Foundation

typealias CallbackEvent = (([String: Any]) -> ())

// This is a simple event handler that dispatches events to subscribed callbacks
// it could ie be extended to feed state machines if one wanted.
class SimpleEventHandler {
    
    enum Event {
        case userInput
        case eventX
        case eventY
        case eventZ
    }

    static var defaultHandler = SimpleEventHandler()
    
    var eventHooks: [Event: [String: CallbackEvent]] = [:]
    
    func add(id: String, forEvent event: Event, callback: @escaping CallbackEvent) {
        if let _ = eventHooks[event] {
            eventHooks[event]?[id] = callback
        } else {
            eventHooks[event] = [id: callback]
        }
    }

    func remove(id: String, forEvent event: Event) {
        _ = eventHooks[event]?.removeValue(forKey: id)
    }
    
    func handle(event: Event, eventData: [String: Any]) {
        if let callbacks = eventHooks[event] {
            for callback in callbacks {
                callback.value(eventData)
            }
        }
    }
}

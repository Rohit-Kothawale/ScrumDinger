import Foundation

struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lenghtInMinutes: Int
    var theme: Theme
    var lengthInMinuteAsDouble: Double {
        get {
            Double(lenghtInMinutes)
        }

        set {
            lenghtInMinutes = Int(newValue)
        }
    }

    init(id: UUID = UUID(), title: String, attendees: [String], lenghtInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lenghtInMinutes = lenghtInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        var id: UUID
        var name: String

        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }

    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lenghtInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lenghtInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lenghtInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lenghtInMinutes: 5, theme: .poppy)
    ]
}

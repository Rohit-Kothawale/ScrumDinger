import SwiftUI

@MainActor
class scrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []

    private static func fileUrl() throws -> URL {
        let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        print(path)
        return path.appendingPathComponent("scrums.data")
    }

    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileUrl = try Self.fileUrl()

            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }

            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }

        let scrums = try await task.value
        self.scrums = scrums
    }

    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileUrl()

            try data.write(to: outfile)
        }

        _ = try await task.value
    }
}

import Foundation

struct Purchase: Identifiable, Codable {
    let id: UUID
    let total: Double
    let date: Date

    init(id: UUID = UUID(), total: Double, date: Date = Date()) {
        self.id = id
        self.total = total
        self.date = date
    }
}

//Task Data Defintion
import SwiftData
import Foundation

@Model
final class Task {
    var title: String
    var dueDate: Date
    var energyLevel: Int
    var isCompleted: Bool = false
    var category: Category?
    
    init(title: String, dueDate: Date, energyLevel: Int, category: Category? = nil) {
        self.title = title
        self.dueDate = dueDate
        self.energyLevel = energyLevel
        self.category = category
    }
}

//Task Data Defintion
import SwiftData

@Model
final class DemoProfile {
    var catName: String
    var totalEnergy: Int = 0

    init(catName: String) {
        self.catName = catName
    }
}


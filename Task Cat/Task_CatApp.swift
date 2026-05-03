import SwiftUI
import SwiftData
@main
struct Task_CatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
                .preferredColorScheme(ColorScheme.dark)
        }
        .modelContainer(for: [
            Category.self,
            DemoProfile.self,
            Task.self])
                        
    }
}


import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isAuthenticated = false
    @Query() var categories: [Category]
    
    var body: some View {
        if !isAuthenticated {
            AuthView(onLogin: {isAuthenticated = true})
        }
        else if categories.isEmpty {
            OnboardingView()
        }
        else {
            TabView {
                Tab("Today", systemImage: "list.bullet.clipboard") {
                    TodayView()
                }
                
                Tab("Upcoming", systemImage: "calendar") {
                    UpcomingView()
                }
                
                Tab("Cat Care", systemImage: "pawprint") {
                    CatView()
                }
                Tab("Settings", systemImage: "gear") {
                    SettingsView()
                }
            }
            .tint(Color.purple)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}

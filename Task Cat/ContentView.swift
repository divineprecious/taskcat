import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    var body: some View {
        if isAuthenticated {
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
        else {
            AuthView(isAuthenticated: $isAuthenticated)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}

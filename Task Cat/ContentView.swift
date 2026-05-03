import SwiftUI
import SwiftData


struct ContentView: View {


    @State private var isAuthenticated = false


    @Environment(\.modelContext) private var context
    @Query var categories: [Category]
    @Query var tasks: [Task]


    var body: some View {


        if !isAuthenticated {
            AuthView(onLogin: {
                isAuthenticated = true
            })


        } else if categories.isEmpty {
            OnboardingView()


        } else {


            TabView {


                Tab("Create", systemImage: "plus") {
                    CreateTaskView()
                }


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
            .tint(.purple)


            // Reset tasks on fresh launch
            .onAppear {
                for task in tasks {
                    context.delete(task)
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}



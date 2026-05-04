import SwiftUI
import SwiftData

@Observable
class CatName {
    var name: String = ""
}

struct ContentView: View {

    @State private var name = CatName()
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


                Tab("Tasks", systemImage: "list.bullet.clipboard") {
                    TasksView()
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



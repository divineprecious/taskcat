import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            MainView()
        } else {
            AuthView(isAuthenticated: $isAuthenticated)
        }
    }
}

// LOGIN
struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isAuthenticated: Bool

    var body: some View {
        VStack {
            Text("Task App")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                if email == "test@test.com" && password == "1234" {
                    isAuthenticated = true
                }
            }
        }
        .padding()
    }
}

// MAIN VIEW
struct MainView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Text("Today")
                }

            Text("Upcoming")
                .tabItem {
                    Text("Upcoming")
                }

            Text("Settings")
                .tabItem {
                    Text("Settings")
                }
        }
    }
}

// TASK PAGE
struct TodayView: View {
    @State private var tasks: [String] = []
    @State private var newTask = ""

    var body: some View {
        VStack {
            TextField("New Task", text: $newTask)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Task") {
                if !newTask.isEmpty {
                    tasks.append(newTask)
                    newTask = ""
                }
            }

            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


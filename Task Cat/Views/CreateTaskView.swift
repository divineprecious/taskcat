import SwiftUI
import SwiftData

struct CreateTaskView: View {
    @State private var tasks: [String] = []
    @State private var newTask = ""
    @Query var categories: [Category]

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
                ForEach(categories) {
                    Text($0.name)
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
    CreateTaskView()
        .preferredColorScheme(ColorScheme.dark)
}


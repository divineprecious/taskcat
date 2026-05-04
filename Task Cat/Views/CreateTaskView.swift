import SwiftUI
import SwiftData

struct CreateTaskView: View {

    @State private var title = ""
    @State private var energyLevel = 1
    @State private var dueDate = Date()

    @Environment(\.modelContext) private var context
    @Query(sort: \Task.dueDate) var tasks: [Task]

    var body: some View {
        VStack(spacing: 20) {

            TextField("Task Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding()

            Stepper("Energy Level: \(energyLevel)", value: $energyLevel, in: 1...5)
                .padding()

            DatePicker("Due Date", selection: $dueDate)
                .padding()

            Button("Add Task") {
                if !title.isEmpty {
                    let newTask = Task(
                        title: title,
                        dueDate: dueDate,
                        energyLevel: energyLevel
                    )
                    context.insert(newTask)
                    title = ""
                }
            }

            List {
                ForEach(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title)
                        Text("Energy: \(task.energyLevel)")
                            .font(.caption)
                        Text(task.dueDate.formatted())
                            .font(.caption2)
                    }
                }
            }
        }
    }
}

#Preview {
    CreateTaskView()
        .modelContainer(for: Task.self, inMemory: true)
}

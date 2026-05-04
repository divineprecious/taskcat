import SwiftUI
import SwiftData

struct TasksView: View {
    @Query(sort: \Task.dueDate) var tasks: [Task]
    
    var body: some View {
        VStack {
            Text("Current Tasks")
                .font(.title)
                .padding()
            List {
                ForEach(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title)
                        Text("Energy: \(task.energyLevel)")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

#Preview {
    TasksView()
        .modelContainer(for: [Task.self, DemoProfile.self, Category.self], inMemory: true)
        .preferredColorScheme(ColorScheme.dark)
}

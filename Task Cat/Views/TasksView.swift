import SwiftUI
import SwiftData

struct TasksView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Task.dueDate) var tasks: [Task]
    
    var body: some View {
        VStack {
            Text("Current Tasks")
                .font(.title)
                .padding()
            List {
                ForEach(tasks) { task in
                    HStack {
                        Button(action: {
                            task.isCompleted.toggle()
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                            
                            Text("Energy: \(task.energyLevel)")
                                .font(.caption)
                            
                            Text(task.dueDate.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption2)
                        }
                        Spacer()
                        
                        Button(action: {
                            context.delete(task)
                        }) {
                            Image(systemName: "trash")
                            
                        }
                    }
                }
            }
        }
    }
    
}

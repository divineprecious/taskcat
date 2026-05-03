import SwiftUI
import SwiftData

struct TodayView: View {
    @Query var tasks: [Task]
    
    var body: some View {
        VStack {
            Text("Today's Tasks")
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
    TodayView()
        .preferredColorScheme(ColorScheme.dark)
}

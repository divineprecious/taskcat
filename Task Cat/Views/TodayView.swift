import SwiftUI
import SwiftData

struct TodayView: View {
    @Query var categories: [Category]
    
    var body: some View {
        VStack {
            Text("Today's Tasks")
            //Sample Example for How to Get Categories
            List {
                ForEach(categories) {
                    Text($0.name)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TodayView()
        .preferredColorScheme(ColorScheme.dark)
}

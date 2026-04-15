// Upcoming
import SwiftUI

struct UpcomingView: View {
    var body: some View {
        VStack {
            Text("Upcoming Tasks")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TodayView()
        .preferredColorScheme(ColorScheme.dark)
}

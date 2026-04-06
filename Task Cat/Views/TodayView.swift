import SwiftUI

struct TodayView: View {
    var body: some View {
        VStack {
            Text("Today's Tasks")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TodayView()
        .preferredColorScheme(ColorScheme.dark)
}

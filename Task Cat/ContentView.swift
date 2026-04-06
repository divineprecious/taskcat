import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            AuthView()
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}

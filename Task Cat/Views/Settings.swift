import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(ColorScheme.dark)
}


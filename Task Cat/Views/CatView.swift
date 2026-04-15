import SwiftUI

struct CatView: View {
    var body: some View {
        VStack {
            Text("Cat")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CatView()
        .preferredColorScheme(ColorScheme.dark)
}

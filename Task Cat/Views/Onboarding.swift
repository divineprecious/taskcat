import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @State private var name: String = ""
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack {
            Image("Icon")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 200)
            Text("What would you like to name your cat?")
                .font(.largeTitle)
                .bold()
                
            TextField("Cat Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
                .foregroundStyle(.white)
                .padding()
            Spacer().frame(height: 50)
            Button("Finish Onboarding") {
                createDefaultCategories()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(18)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    
    private func createDefaultCategories() {
        let categories: [Category] = [
            Category(name: "School"),
            Category(name: "Work"),
            Category(name: "Personal"),]
        
        var newProfile = DemoProfile(catName: name)
        
        for category in categories {
            context.insert(category)
        }
        context.insert(newProfile)
        try? context.save()
    }
    
}

#Preview {
    OnboardingView()
        .preferredColorScheme(ColorScheme.dark)
}


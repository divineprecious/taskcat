import SwiftUI
import SwiftData

struct SettingsView: View {
    let moonGray = Color(white: 0.5, opacity: 0.7)
    
    @Query var profiles: [DemoProfile]
    @Environment(\.modelContext) private var context
    
    @State private var confirmation = false
    @State private var newName = ""
    @State private var isRenaming = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .navigationBarBackButtonHidden(true)
            
            Button("Rename Cat"){
                newName = profiles.first?.catName ?? "Cat"
                isRenaming.toggle()
            }//Button
            
            Button("Delete Account"){
                
            }//Button
            
            if isRenaming {
                VStack {
                    TextField("Enter new name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    HStack {
                        Button("Cancel") {
                            isRenaming = false
                        }//Button
                        
                        Button("Save") {
                            if let profile = profiles.first {
                                profile.catName = newName
                            }
                            isRenaming = false
                        }//Button
                        .buttonStyle(.borderedProminent)
                    }//HStack
                }//VStack
            }//If statement
        }//VStack
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .tint(moonGray)
    }//Body
}//Struct
#Preview {
    SettingsView()
        .modelContainer(for: [DemoProfile.self, Category.self], inMemory: true)
        .preferredColorScheme(ColorScheme.dark)
}

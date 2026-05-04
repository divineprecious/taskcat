import SwiftUI
import SwiftData

struct SettingsView: View {
    let moonGray = Color(white: 0.5, opacity: 0.7)
    
    @Query var profiles: [DemoProfile]
    @Environment(\.modelContext) private var modelContext
    
    @State private var renameCat = false
    @State private var deleteConfirmation = false
    @State private var newName = ""
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .navigationBarBackButtonHidden(true)
            
            Spacer()
            
            Button("Rename Cat"){
                renameCat = true
            }//Button
            .padding()
            .alert("Enter new name:", isPresented: $renameCat){
                TextField("New name", text: $newName)
                Button("OK"){
                    if let profile = profiles.first {
                        profile.catName = newName
                    }//if
                    newName = ""
                }//Button
                Button("Cancel", role: .cancel){}
            }//Alert
            
            Button("Delete Account"){
                deleteConfirmation = true
            }//Button
            .padding()
            .alert("Delete Account?", isPresented: $deleteConfirmation){
                Button("Delete", role: .destructive) {
                    for profile in profiles {
                        modelContext.delete(profile)
                    }
                }
                Button("Cancel", role: .cancel){}
            }//Alert
            
            Spacer()
            
        }//VStack
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 10))
    }//Body
}//Struct
#Preview {
    SettingsView()
        .modelContainer(for: [DemoProfile.self, Category.self], inMemory: true)
        .preferredColorScheme(ColorScheme.dark)
}

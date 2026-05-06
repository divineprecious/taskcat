import SwiftUI
import SwiftData

struct CatView: View {
    let moonGray = Color(white: 0.5, opacity: 0.7)
    
    @Query var profiles: [DemoProfile]
    @State private var catImg = "cat_default"
    @Environment(\.modelContext) private var context
    
    
    @State private var heart = 0

    func catInteraction(heartGain: Int, energyCost: Int, image: String){
        heart = min(heart + heartGain, 100)
        guard let profile = profiles.first else { return }
        profile.totalEnergy -= energyCost
        try? context.save()
        catImg = image
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            catImg = "cat_default"
        }
    }

    var body: some View {
                
        VStack {
            Text(profiles.first?.catName ?? "Cat")
                .font(.title)
                .bold()
                .foregroundStyle(.purple)
                .padding(.leading, 50)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            HStack{
                Label("\(heart)", systemImage: "heart.circle")
                    .foregroundStyle(.pink)
                    .frame(width: 100, height: 40)
                    .background(Capsule().fill(moonGray))
                
                Spacer()
                
                Label("\(profiles.first?.totalEnergy ?? 0)",systemImage: "bolt.fill")
                    .foregroundStyle(.yellow)
                    .frame(width: 100, height: 40)
                    .background(Capsule().fill(moonGray))
                
            }//HStack
            .font(.title)
            .padding(25)
            
            Image(catImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
            
            HStack{
                
                Button {
                    catInteraction(heartGain: 1, energyCost: 1, image: "cat_eat")
                } label: {
                    VStack {
                        Text("Feed")
                        Label("1", systemImage: "bolt.fill")
                    }
                }
                //Button
                
                Button{
                    catInteraction(heartGain: 2, energyCost: 2, image: "cat_pet")
                } label: {
                    VStack {
                        Text("Pet")
                        Label("2", systemImage: "bolt.fill")
                    }
                }
                //Button
                
                Button{
                    catInteraction(heartGain: 3, energyCost: 3, image: "cat_treat")
                } label: {
                    VStack {
                        Text("Treat")
                        Label("3", systemImage: "bolt.fill")
                    }
                }
                //Button
                
                Button{
                    catInteraction(heartGain: 5, energyCost: 5, image: "cat_play")
                } label: {
                    VStack {
                        Text("Play")
                        Label("5", systemImage: "bolt.fill")
                    }
                }
                //Button
                
                
            }//HStack
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .foregroundStyle(.yellow)
            .tint(moonGray)

        }//VStack
        .navigationBarBackButtonHidden(true)
    }//Body
}//Struct

#Preview {
    CatView()
        .modelContainer(for: DemoProfile.self, inMemory: true)
        .preferredColorScheme(ColorScheme.dark)
}

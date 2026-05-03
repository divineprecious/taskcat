import SwiftUI

struct CatView: View {
    let moonGray = Color(white: 0.5, opacity: 0.7)
    
    @State private var catName = "Colonel Paws"
    @State private var catImg = "cat_default"
    
    @State private var heart = 0
    @State private var energy = 0

    var body: some View {
        
        VStack {
            Text("\(catName)")
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
                
                Label("\(energy)", systemImage: "bolt.fill")
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
                Button(action: {heart+=1; energy-=1; if heart >= 100 {heart = 100};
                    catImg = "cat_eat";
                    DispatchQueue.main.asyncAfter(deadline:.now() + 1.0){
                        catImg = "cat_default"};
                }){
                    VStack{
                        Text("Feed")
                        Label("1", systemImage: "bolt.fill")
                    }
                }//Button
                .disabled(energy < 1)

                Button(action: {heart+=2; energy-=2; if heart >= 100 {heart = 100};
                    catImg = "cat_pet";
                    DispatchQueue.main.asyncAfter(deadline:.now() + 1.0){
                        catImg = "cat_default"};
                    }){
                    VStack{
                        Text("Pet")
                        Label("2", systemImage: "bolt.fill")
                    }
                }//Button
                .disabled(energy < 2)
                
                Button(action: {heart+=3; energy-=3; if heart >= 100 {heart = 100};
                    catImg = "cat_treat";
                    DispatchQueue.main.asyncAfter(deadline:.now() + 1.0){
                        catImg = "cat_default"};
                    }){
                    VStack{
                        Text("Treat")
                        Label("3", systemImage: "bolt.fill")
                    }
                }//Button
                .disabled(energy < 3)
                
                Button(action: {heart+=5; energy-=5; if heart >= 100 {heart = 100};
                    catImg = "cat_play";
                    DispatchQueue.main.asyncAfter(deadline:.now() + 1.0){
                        catImg = "cat_default"};
                    }){
                    VStack{
                        Text("Play")
                        Label("5", systemImage: "bolt.fill")
                    }
                }//Button
                .disabled(energy < 5)

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
        .preferredColorScheme(ColorScheme.dark)
}

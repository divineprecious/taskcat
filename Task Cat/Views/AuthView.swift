import SwiftUI

struct AuthView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var isAuthenticated: Bool
    
    let testEmail = "test@test.com"
    let testPassword = "password123"
    
    
    var body: some View {
        VStack {
            Text("Welcome to Task Cat!")
                .font(Font.largeTitle.bold())
            Text("Your Personal Task Manager")
            
            Image("Icon")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 200)
            
            Text("Email address*")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Email address", text: $email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
                .foregroundStyle(.white)
            
            
            Text("Password*")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
            VStack {
                Button("Sign In") {
                    loginUser()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(18)
            }
            .padding(.vertical, 15)
        }
    }
    
    func loginUser() {
        if email == testEmail && password == testPassword {
            isAuthenticated = true
        }
    }
}

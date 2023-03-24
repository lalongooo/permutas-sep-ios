import SwiftUI
import FBSDKLoginKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Login with Facebook")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            FacebookLoginButton()
                .frame(width: 200, height: 40)
                .padding(.bottom, 10)
        }
    }
}

struct FacebookLoginButton: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIView(context: Context) -> FBLoginButton {
        let button = FBLoginButton()
        button.delegate = context.coordinator
        return button
    }

    func updateUIView(_ uiView: FBLoginButton, context: Context) {
    }

    class Coordinator: NSObject, LoginButtonDelegate {
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let result = result, !result.isCancelled {
                print("Logged in with Facebook")
            } else {
                print("User canceled Facebook login")
            }
        }

        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            print("Logged out from Facebook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

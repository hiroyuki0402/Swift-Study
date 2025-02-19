import SwiftUI

struct ContentView: View {
    @State private var message: String = "Hello, Appium!"
    @State private var inputText: String = ""

    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .padding()
                .accessibilityIdentifier("messageText")

            TextField("Enter text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityIdentifier("textField")

            Button(action: {
                message = inputText
            }) {
                Text("保存")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("tapButton")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

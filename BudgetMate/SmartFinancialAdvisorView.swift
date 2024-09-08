import SwiftUI

struct SmartFinancialAdvisorView: View {
    @State private var userInput: String = "" // User input from the text field
    @State private var conversation: [Message] = [
        Message(text: "Hello! I'm your Smart Financial Advisor. How can I assist you today?", isUser: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    // Scrollable conversation area
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(conversation) { message in
                                HStack {
                                    if message.isUser {
                                        Spacer()
                                        UserBubble(text: message.text)
                                    } else {
                                        BotBubble(text: message.text)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    // User input area
                    HStack {
                        TextField("Ask me anything...", text: $userInput)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        Button(action: {
                            handleUserInput()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Smart Financial Advisor") // Navigation bar title
        }
    }
    
    // Handle user input and add responses from the AI
    func handleUserInput() {
        if !userInput.isEmpty {
            let userMessage = Message(text: userInput, isUser: true)
            conversation.append(userMessage)
            userInput = "" // Clear input field
            
            // Simulate AI-driven response
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let botMessage = generateBotResponse(for: userMessage.text)
                conversation.append(Message(text: botMessage, isUser: false))
            }
        }
    }
    
    // Simulate a bot response (this can be replaced with GPT API calls)
    func generateBotResponse(for input: String) -> String {
        if input.lowercased().contains("budget") {
            return "It looks like you're interested in budgeting. I recommend reducing discretionary spending by 10% to stay within your budget."
        } else if input.lowercased().contains("saving") {
            return "Great! To achieve your saving goals, try setting aside 20% of your income each month. How much would you like to save?"
        } else if input.lowercased().contains("spending") {
            return "You've been spending more on dining this month. Consider reducing it by 10% to boost your savings."
        } else {
            return "That's a good question! How about starting with tracking your expenses more closely?"
        }
    }
}

// Message struct for storing conversation data
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

// Chat bubble for user messages
struct UserBubble: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.green.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(maxWidth: 250, alignment: .trailing)
    }
}

// Chat bubble for bot messages
struct BotBubble: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.blue.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(maxWidth: 250, alignment: .leading)
    }
}

struct SmartFinancialAdvisorView_Previews: PreviewProvider {
    static var previews: some View {
        SmartFinancialAdvisorView()
    }
}

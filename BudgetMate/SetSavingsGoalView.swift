import SwiftUI

struct SetSavingsGoalView: View {
    // State variables for user input
    @State private var goalName: String = ""
    @State private var targetAmount: Double = 0.0
    @State private var currentSavings: Double = 0.0
    @State private var deadline: Date? = nil
    @State private var showDeadlinePicker: Bool = false
    
    var body: some View {
        ZStack {
            // Background Gradient (consistent with Dashboard)
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Title
                    Text("Set Your Savings Goal")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    // Section: Goal Name
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "text.badge.plus")
                                .foregroundColor(.blue)
                                .font(.title2)
                            Text("Goal Name")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        TextField("Enter goal name (e.g., Vacation Fund)", text: $goalName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Section: Target Amount
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("Target Amount")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        TextField("Enter target amount", value: $targetAmount, format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Section: Current Savings
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                            Text("Current Savings")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        TextField("Enter current savings", value: $currentSavings, format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Section: Deadline (Optional)
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.purple)
                                .font(.title2)
                            Text("Deadline (Optional)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Toggle("Set a deadline", isOn: $showDeadlinePicker)
                            .toggleStyle(SwitchToggleStyle(tint: .white))
                            .padding(.horizontal)
                        
                        if showDeadlinePicker {
                            // Handle optional deadline with default value
                            DatePicker(
                                "Select a deadline",
                                selection: Binding(
                                    get: { deadline ?? Date() },   // Provide default value if nil
                                    set: { deadline = $0 }         // Update deadline when changed
                                ),
                                displayedComponents: .date
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Section: Progress Bar
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.orange)
                                .font(.title2)
                            Text("Progress")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        ProgressView(value: currentSavings / max(targetAmount, 1.0))
                            .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            .scaleEffect(x: 1, y: 2, anchor: .center)
                            .padding(.horizontal)
                        Text("\(Int((currentSavings / max(targetAmount, 1.0)) * 100))% of your goal completed")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    // Save Button
                    Button(action: {
                        // Handle save action
                        print("Saving goal: \(goalName)")
                    }) {
                        Text("Save Goal")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom, 50) // Add padding at the bottom for space
            }
        }
        .navigationTitle("Set Savings Goal")
    }
}

struct SetSavingsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetSavingsGoalView()
    }
}


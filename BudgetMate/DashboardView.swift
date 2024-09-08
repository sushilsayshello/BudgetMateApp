import SwiftUI

struct DashboardView: View {
    @State private var isSetSavingsGoalActive = false // State variable to control navigation for Set Savings Goal

    // Simulated data for the purpose of this example
    @State private var currentBalance: Double = 1250.50
    @State private var savingsGoalProgress: Double = 0.75 // 75% progress
    @State private var spendingOverview = [
        "Groceries": 300.00,
        "Dining": 150.00,
        "Utilities": 200.00
    ]
    @State private var financialHealthScore: Int = 85 // out of 100
    @State private var alerts: [String] = [
        "You have exceeded your dining budget by $50!",
        "Savings goal almost reached!"
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Section: Current Balance
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.green)
                                    .font(.title)
                                Text("Current Balance")
                                    .font(.headline)
                                    .padding(.leading, 5)
                            }
                            Text("$\(String(format: "%.2f", currentBalance))")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                        // Section: Savings Goal Progress
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "target")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                Text("Savings Goal Progress")
                                    .font(.headline)
                                    .padding(.leading, 5)
                            }
                            ProgressView(value: savingsGoalProgress)
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                .scaleEffect(x: 1, y: 2, anchor: .center)
                            Text("\(Int(savingsGoalProgress * 100))% of your goal reached")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                        // Section: Spending Overview
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "list.bullet.rectangle")
                                    .foregroundColor(.orange)
                                    .font(.title)
                                Text("Spending Overview (This Month)")
                                    .font(.headline)
                                    .padding(.leading, 5)
                            }
                            ForEach(spendingOverview.keys.sorted(), id: \.self) { category in
                                HStack {
                                    Text(category)
                                        .font(.subheadline)
                                    Spacer()
                                    Text("$\(String(format: "%.2f", spendingOverview[category]!))")
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                        // Section: Financial Health Score
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(financialHealthScore >= 70 ? .green : .red)
                                    .font(.title)
                                Text("Financial Health Score")
                                    .font(.headline)
                                    .padding(.leading, 5)
                            }
                            Text("\(financialHealthScore)/100")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(financialHealthScore >= 70 ? .green : .red)
                            Text("Based on your savings, spending, and debts")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                        // Section: Quick Actions
                        VStack(spacing: 10) {
                            // Set Savings Goal Button
                            NavigationLink(destination: SetSavingsGoalView()) {
                                Text("Set Savings Goal")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }

                            // View Analytics Button
                            NavigationLink("View Analytics", value: "spendingAnalytics")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)

                            // Financial Quests & Achievements Button
                            NavigationLink(destination: FinancialQuestsView()) {
                                Text("Financial Quests & Achievements")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                    .cornerRadius(10)
                            }

                            // Alerts & Notifications Button
                            NavigationLink(destination: AlertsAndNotificationsView()) {
                                Text("Alerts & Notifications")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }

                            // Banks and Card Integration Button
                            NavigationLink(destination: BanksAndCardsIntegrationView()) {
                                Text("Banks & Cards Integration")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.purple)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
                .navigationTitle("Dashboard")
                .navigationDestination(for: String.self) { value in
                    if value == "spendingAnalytics" {
                        SpendingAnalyticsView()
                    }
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

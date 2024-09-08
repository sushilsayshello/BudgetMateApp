import SwiftUI
import Charts

struct SpendingAnalyticsView: View {
    
    // Sample data for spending breakdown by category
    let spendingData: [SpendingCategory] = [
        SpendingCategory(category: "Groceries", amount: 300),
        SpendingCategory(category: "Rent", amount: 900),
        SpendingCategory(category: "Entertainment", amount: 150),
        SpendingCategory(category: "Dining", amount: 100),
        SpendingCategory(category: "Utilities", amount: 200)
    ]
    
    // Sample data for monthly trends
    let monthlyTrendData: [MonthlySpending] = [
        MonthlySpending(month: "Jan", amount: 1200),
        MonthlySpending(month: "Feb", amount: 1300),
        MonthlySpending(month: "Mar", amount: 1100),
        MonthlySpending(month: "Apr", amount: 1150),
        MonthlySpending(month: "May", amount: 1250)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Section: Category Breakdown
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "chart.pie.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                        Text("Category Breakdown")
                            .font(.headline)
                    }
                    PieChartView(data: spendingData)
                        .frame(height: 250)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                // Section: Monthly Spending Trends
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.green)
                            .font(.title2)
                        Text("Monthly Spending Trends")
                            .font(.headline)
                    }
                    LineChartView(data: monthlyTrendData)
                        .frame(height: 250)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                // Section: National Comparison
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.orange)
                            .font(.title2)
                        Text("National Spending Comparison")
                            .font(.headline)
                    }
                    Text("• You spend 20% less on groceries than the national average.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("• You spend 10% more on entertainment than the national average.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                // Section: Recommendations
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                            .font(.title2)
                        Text("AI-Powered Recommendations")
                            .font(.headline)
                    }
                    Text("• Consider reducing your entertainment spending by 10% to save more.")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.vertical, 5)
                    Text("• Your grocery spending is under control. Keep up the good work!")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding(.vertical, 5)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
            }
            .padding()
            .navigationTitle("Spending Analytics")
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all))
    }
}

struct SpendingCategory {
    let category: String
    let amount: Double
}

struct MonthlySpending {
    let month: String
    let amount: Double
}



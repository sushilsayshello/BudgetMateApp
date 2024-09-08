import SwiftUI

struct AlertsAndNotificationsView: View {
    @State private var overspendingAlerts = [
        "You have exceeded your dining budget by $50.",
        "You've spent $200 more than your grocery budget."
    ]
    
    @State private var savingsMissedAlerts = [
        "You are $100 behind on your vacation savings goal.",
        "You missed your monthly savings target by 10%."
    ]
    
    @State private var customAlerts = [
        CustomAlert(name: "Dining Alert", condition: "Spend more than $100 on dining"),
        CustomAlert(name: "Shopping Alert", condition: "Spend more than $200 on shopping")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Alerts & Notifications")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionHeaderView(iconName: "exclamationmark.triangle.fill", title: "Overspending Alerts", iconColor: .red)
                        
                        ForEach(overspendingAlerts, id: \.self) { alert in
                            AlertCardView(alert: alert, color: .red)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionHeaderView(iconName: "flag.fill", title: "Savings Missed Alerts", iconColor: .yellow)
                        
                        ForEach(savingsMissedAlerts, id: \.self) { alert in
                            AlertCardView(alert: alert, color: .yellow)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionHeaderView(iconName: "bell.fill", title: "Custom Alerts", iconColor: .green)
                        
                        ForEach(customAlerts) { alert in
                            CustomAlertCardView(alert: alert)
                        }
                        
                        Button(action: {
                            // Action to add a new custom alert
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                                Text("Add Custom Alert")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
        }
        .navigationTitle("Alerts & Notifications")
    }
}

// Alert Card View
struct AlertCardView: View {
    var alert: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(color)
                .font(.title2)
            Text(alert)
                .font(.subheadline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Custom Alert Card View
struct CustomAlertCardView: View {
    var alert: CustomAlert
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(alert.name)
                .font(.headline)
                .foregroundColor(.white)
            Text(alert.condition)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Struct for CustomAlert data
struct CustomAlert: Identifiable {
    var id = UUID()
    var name: String
    var condition: String
}

struct AlertsAndNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsAndNotificationsView()
    }
}


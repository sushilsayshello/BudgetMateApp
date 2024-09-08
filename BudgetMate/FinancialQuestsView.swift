import SwiftUI

struct FinancialQuestsView: View {
    @State private var availableQuests = [
        Quest(name: "Save $200 in 30 days", progress: 0.6, target: 200),
        Quest(name: "Reduce discretionary spending by 15%", progress: 0.4, target: 100),
        Quest(name: "Save for an emergency fund", progress: 0.2, target: 500)
    ]
    
    @State private var achievements = [
        Achievement(name: "Savings Master", description: "Completed 5 savings goals", badge: "🏆"),
        Achievement(name: "Budget Guru", description: "Reduced spending by 20%", badge: "🎖️"),
        Achievement(name: "Emergency Ready", description: "Saved 3 months of expenses", badge: "🏅")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Financial Quests & Achievements")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionHeaderView(iconName: "flag.fill", title: "Available Quests", iconColor: .yellow)
                        
                        ForEach(availableQuests) { quest in
                            QuestCardView(quest: quest)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionHeaderView(iconName: "star.fill", title: "Achievements", iconColor: .yellow)
                        
                        ForEach(achievements) { achievement in
                            AchievementCardView(achievement: achievement)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
        }
        .navigationTitle("Quests & Achievements")
    }
}

// Updated Section Header View
struct SectionHeaderView: View {
    var iconName: String
    var title: String
    var iconColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
                .font(.title2)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(.bottom, 5)
    }
}

// Updated Quest and Achievement Cards with consistent font sizes
struct QuestCardView: View {
    var quest: Quest
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(quest.name)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Text("\(Int(quest.progress * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            ProgressView(value: quest.progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                .scaleEffect(x: 1, y: 2, anchor: .center)
            HStack {
                Text("Target: $\(quest.target, specifier: "%.0f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text("Progress: $\(quest.progress * quest.target, specifier: "%.0f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct AchievementCardView: View {
    var achievement: Achievement
    
    var body: some View {
        HStack {
            Text(achievement.badge)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text(achievement.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(achievement.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Structs for Quest and Achievement data
struct Quest: Identifiable {
    var id = UUID()
    var name: String
    var progress: Double
    var target: Double
}

struct Achievement: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var badge: String
}

struct FinancialQuestsView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialQuestsView()
    }
}

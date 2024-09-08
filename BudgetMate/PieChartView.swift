import SwiftUI
import Charts

struct PieChartView: View {
    let data: [SpendingCategory]
    
    var body: some View {
        Chart {
            ForEach(data, id: \.category) { item in
                SectorMark(
                    angle: .value("Spending", item.amount),
                    innerRadius: .ratio(0.5),
                    angularInset: 0.05
                )
                .foregroundStyle(by: .value("Category", item.category))
            }
        }
        .chartLegend(position: .bottom, spacing: 15) // Adds a legend for categories
        .chartForegroundStyleScale([
            "Groceries": .blue,
            "Rent": .green,
            "Entertainment": .orange,
            "Dining": .red,
            "Utilities": .purple
        ])
    }
}


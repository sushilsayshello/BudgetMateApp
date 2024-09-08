import SwiftUI
import Charts

struct LineChartView: View {
    let data: [MonthlySpending]
    
    var body: some View {
        Chart {
            ForEach(data, id: \.month) { item in
                LineMark(
                    x: .value("Month", item.month),
                    y: .value("Spending", item.amount)
                )
                .symbol(by: .value("Month", item.month))
                .foregroundStyle(.blue)
            }
        }
        .chartYScale(domain: [1000, 1500]) // Set Y-axis range for consistency
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic) { value in
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading, values: .automatic) { value in
                // Correctly format the currency
                AxisValueLabel(value.as(Double.self)!.formatted(.currency(code: "USD")))
            }
        }
    }
}


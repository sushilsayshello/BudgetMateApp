import SwiftUI
import PDFKit

struct CustomReportsView: View {
    @State private var startDate = Date() // Start date for the report
    @State private var endDate = Date() // End date for the report
    @State private var exportFormat: ExportFormat = .pdf // Default export format
    @State private var reportData = "" // Placeholder for the generated report data
    @State private var isLoading = false // Loading indicator
    @State private var showExportButton = false // Show Export button after report is generated
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    // Interactive card for date range selection
                    VStack(spacing: 15) {
                        Text("Select Date Range")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        // Start Date
                        DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        // End Date
                        DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Export Format Picker
                    Picker("Export Format", selection: $exportFormat) {
                        Text("PDF").tag(ExportFormat.pdf)
                        Text("CSV").tag(ExportFormat.csv)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    // Generate Report Button
                    Button(action: {
                        isLoading = true
                        generateReport()
                    }) {
                        HStack {
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.white)
                            Text("Generate Report")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Show progress indicator while loading
                    if isLoading {
                        ProgressView("Generating Report...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .padding()
                    }
                    
                    // Export Report Button
                    if showExportButton {
                        Button(action: {
                            exportReport()
                        }) {
                            HStack {
                                Image(systemName: exportFormat == .pdf ? "doc.richtext.fill" : "doc.text.magnifyingglass")
                                    .foregroundColor(.white)
                                Text("Export \(exportFormat == .pdf ? "PDF" : "CSV")")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Custom Reports")
            }
        }
    }
    
    // Simulate report generation with a delay
    func generateReport() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simulate a delay
            reportData = """
            Financial Health Report
            =======================
            Date Range: \(formatDate(startDate)) to \(formatDate(endDate))
            
            Spending Patterns:
            - Groceries: $300
            - Dining: $150
            - Entertainment: $100
            
            Savings Progress:
            - Vacation Fund: 75% achieved
            
            Debt Management:
            - Credit Card Debt: $1000 remaining
            """
            isLoading = false
            showExportButton = true
        }
    }
    
    // Export report based on the selected format (PDF or CSV)
    func exportReport() {
        if exportFormat == .pdf {
            exportToPDF()
        } else {
            exportToCSV()
        }
    }
    
    // Placeholder for exporting to PDF
    func exportToPDF() {
        print("Exporting report as PDF")
        // Implement PDF export logic here
    }
    
    // Placeholder for exporting to CSV
    func exportToCSV() {
        print("Exporting report as CSV")
        // Implement CSV export logic here
    }
    
    // Format date for display
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

// Enum to track export format selection
enum ExportFormat: String {
    case pdf = "PDF"
    case csv = "CSV"
}

// Preview
struct CustomReportsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomReportsView()
    }
}

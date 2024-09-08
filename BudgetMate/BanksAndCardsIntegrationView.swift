import SwiftUI

struct BanksAndCardsIntegrationView: View {
    @ObservedObject var akahuAPI = AkahuAPI() // Simulating Akahu API integration
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Banks & Cards Integration")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "wallet.pass.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                            Text("Linked Accounts")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        ForEach(akahuAPI.linkedAccounts) { account in
                            HStack {
                                Image(systemName: "banknote.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.green)
                                
                                VStack(alignment: .leading) {
                                    Text(account.bankName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("Balance: $\(String(format: "%.2f", account.balance))")
                                        .font(.subheadline)
                                        .foregroundColor(account.balance < 500 ? .red : .green)
                                }
                                Spacer()
                                
                                Image(systemName: "creditcard.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            akahuAPI.linkBankAccount()
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                                Text("Link Bank Account")
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
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                            Text("Balance Tracking")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        ForEach(akahuAPI.linkedAccounts) { account in
                            HStack {
                                Image(systemName: "building.columns.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                                
                                VStack(alignment: .leading) {
                                    Text(account.bankName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("Balance: $\(String(format: "%.2f", account.balance))")
                                        .font(.subheadline)
                                        .foregroundColor(account.balance < 500 ? .red : .green)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
        }
        .navigationTitle("Banks & Cards")
    }
}

struct BanksAndCardsIntegrationView_Previews: PreviewProvider {
    static var previews: some View {
        BanksAndCardsIntegrationView()
    }
}

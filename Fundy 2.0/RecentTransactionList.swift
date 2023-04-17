//
//  RecentTransactionList.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //MARK: Header Link
                NavigationLink {
                  TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(transactionListVM.transactions.prefix(5)) {transaction in TransactionRow(transaction: transaction)
                
                Divider()
                
            }
            
        }
        
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let TransactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return TransactionListVM
    }()
    static var previews: some View {
        Group {
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
        
    }
}

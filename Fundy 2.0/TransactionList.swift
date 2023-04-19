//
//  TransactionList.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 1/3/2023.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
            VStack{
                List {
                    // MARK: Transaction Groups
                    ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key, content: { month,
                        transactions in
                        Section {
                            // MARK: Transaction List
                            ForEach(transactions) { transaction in
                                TransactionRow(transaction: transaction)
                            }
                        } header: {
                            // MARK: Transaction Month
                            Text(month)
                        }
                        .listSectionSeparator(.hidden)
                        
                    }
                    )}
                
                .listStyle(.plain)
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let TransactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return TransactionListVM
    } ()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView  {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}

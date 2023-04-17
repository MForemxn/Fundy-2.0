//
//  PreviewData.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import Foundation

var TransactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: TransactionPreviewData, count: 10)

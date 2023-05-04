//
//  TransactionListViewModel.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import Foundation
import Combine
import OrderedCollections


typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
        
    }
    
    //function retrieves transaction data from a RESTful API endpoint using an HTTP request. The data is decoded using JSONDecoder and assigned to the transactions property. The function also logs errors and the completion of the fetch.
    func getTransactions() {
        //did this one for flowchart
        guard let url = URL(string: "https://api.npoint.io/af9add659ccd98130350") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{ (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error Fetching Transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
                
            } receiveValue: {[weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        print("accumulateTransactions")
        guard !transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParse()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval")
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, through: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
        }
        
        return cumulativeSum
    }
    
    func determineDailyTotal() -> [Double] {
        var output: [Double] = []
        for value in accumulateTransactions() {
            output.append(value.1)
        }
        return output
    }
    
    static let allTransactionNames: [String] = ["Auto & Transport", "Bills and Utilities", "Entertainment", "Fees & Charges", "Food and Dining", "Home", "Income", "Shopping", "Transfer", "Public Transportation", "Taxi", "Mobile Phone", "Movies and DVD's", "Bank Fees", "Finance Charge", "Groceries", "Restaurants", "Rent", "Home Supplies", "Pay Cheque", "Software", "Credit Card Payment"]
    
    
    //helper function for getTransactions
    func calculateSumOfAllTransactions() -> Double {
        var total: Double = 0
        for transaction in transactions {
            total += transaction.amount
        }
        return total
    }
    
    
    //helper function for getTransactions
    func calculateSumOfExpensesInGivenCategory(categoryName: String) -> Double {
        //did this one for flowchart
        var sumOfTransactionsInCategory: Double = 0
        for transaction in transactions {
            if transaction.category == categoryName && transaction.isExpense {
                sumOfTransactionsInCategory += Double(transaction.amount)
            }
            
        }
        return sumOfTransactionsInCategory
    }
    
    //helper function for getTransactions
    func determineAllCategoryExpenseTotals() -> [Double] {
        var allCategoryTotalsInOrder: [Double] = []
        for Category in TransactionListViewModel.allTransactionNames {
            allCategoryTotalsInOrder.append(calculateSumOfExpensesInGivenCategory(categoryName: Category))
        }
        //print(allCategoryTotalsInOrder)
        return allCategoryTotalsInOrder
    }
    
    
    //combines all transaction categories with their respective sums
    func combineCategoriesWithSums() -> [(categoryName: String, sumTotal: Double)] {
        let categories: [String] = allTransactionCategoryNames
        let values: [Double] = determineAllCategoryExpenseTotals()
        var combinedArrayofTransactionSumsAndCategories: [(categoryName: String, sumTotal: Double)] = []
        print(combinedArrayofTransactionSumsAndCategories)
        
        for i in 0...allTransactionCategoryNames.count - 1 {
            combinedArrayofTransactionSumsAndCategories.append((categoryName: categories[i], sumTotal: values[i]))
        }
        
        return combinedArrayofTransactionSumsAndCategories
    }
    
    //sorts and returns the top three biggest categories based on their sums.
    func findThe3BiggestCategoriesSums() -> [Double] {
        var combinedArray: [(categoryName: String, sumTotal: Double)] = combineCategoriesWithSums()
        
        let sortedCombinedArray = combinedArray.sorted(by: { $0.sumTotal > $1.sumTotal})
        
        var sum: Double = 0
        
        for tuple in sortedCombinedArray {
            sum += tuple.sumTotal
        }
        
        let restSum = sum - sortedCombinedArray[0].sumTotal - sortedCombinedArray[1].sumTotal
        
        // Return the two largest values and the sum of the remaining values as an array
        return [sortedCombinedArray[0].sumTotal, sortedCombinedArray[1].sumTotal, restSum]
    }
    
    func findThe3BiggestCategoriesLabels() -> [String] {
        var combinedArray: [(categoryName: String, sumTotal: Double)] = combineCategoriesWithSums()
        
        let sortedCombinedArray = combinedArray.sorted(by: { $0.sumTotal > $1.sumTotal})
        
        // Return the two largest values and the sum of the remaining values as an array
        return [sortedCombinedArray[0].categoryName, sortedCombinedArray[1].categoryName, "Other"]
    }
}

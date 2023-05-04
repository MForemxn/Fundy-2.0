//
//  TransactionModel.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import Foundation
import SwiftUIFontIcon


//The Transaction struct has properties such as id, date, institution, account, merchant, amount, type, categoryId, category, isPending, isTransfer, isExpense, isEdited, icon, dateParsed, signedAmount, and month. The struct adopts the Identifiable, Decodable, and Hashable protocols.
struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.allCategories.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        return .question
        
    }
    
    var dateParsed: Date {
        date.dateParse()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}


//The TransactionType enum is an enumeration that has two cases: debit and credit.
enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}


//The Category struct has properties such as id, name, icon, and mainCategoryId. It also has static properties for various categories such as autoAndTransport, billsAndUtilities, entertainment, etc. The struct has an extension with computed static properties for categories, subCategories, and allCategories.
struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}


//The extensions to Transaction and Category provide additional computed properties and methods. For example, the Transaction extension provides computed properties for icon, dateParsed, signedAmount, and month. The Category extension provides computed static properties for categories, subCategories, allCategories, and allTransactionNames.
extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills and Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food and Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies and DVD's", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fees", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restraunts = Category(id: 502, name: "Restaraunts", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Pay Cheque", icon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)
    
}


//The extensions to Transaction and Category provide additional computed properties and methods. For example, the Transaction extension provides computed properties for icon, dateParsed, signedAmount, and month. The Category extension provides computed static properties for categories, subCategories, allCategories, and allTransactionNames.
extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restraunts,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    static let allCategories: [Category] = categories + subCategories
}


//The extensions to Transaction and Category provide additional computed properties and methods. For example, the Transaction extension provides computed properties for icon, dateParsed, signedAmount, and month. The Category extension provides computed static properties for categories, subCategories, allCategories, and allTransactionNames.
extension Category {
    static let allTransactionNames: [String] = ["Auto & Transport", "Bills and Utilities", "Entertainment", "Fees & Charges", "Food and Dining", "Home", "Income", "Shopping", "Transfer", "Public Transportation", "Taxi", "Mobile Phone", "Movies and DVD's", "Bank Fees", "Finance Charge", "Groceries", "Restaurants", "Rent", "Home Supplies", "Pay Cheque", "Software", "Credit Card Payment"]
    
}

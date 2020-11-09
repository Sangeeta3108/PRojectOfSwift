//
//  Bank.swift
//  BankXYZ
//
//  Created by mac on 01/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
class Bank{
    
    var accountType:String?
    var accountNumber:String?
    var accountName:String?
    var balance:Double?
    
    //MARK: OPEN ACCOUNT
    func openAccount() {
        print("Enter Account Type: Current or Saving?")
        accountType = input()
       // print(": \(accountType ?? "")")
        print("Enter the Account No: ")
        accountNumber = input()
       // print(": \(accountNumber ?? "")")
        print("Enter Customer Name: ")
        accountName = input()
        //print(": \(accountName ?? "")")
        print("Enter the Balance: $ ")
        balance = Double(readLine()!)!
        //print(": \(balance ?? 0.0)")
        
    }
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return String(data: inputData, encoding: .utf8)!
    }
    //MARK: SHOW ACCOUNT
    func showAccount() {
        print("Account Type: ",accountType ?? "")
        print("Account Number: ",accountNumber ?? "")
        print("Account Name: ",accountName ?? "")
        print("Balance: $ ",balance ?? "")
    }
    //MARK: METHOD TO SEARCH THE ACCOUNT
    func searchAccount(account:String) -> Bool{
        if accountNumber == account{
            showAccount()
            return true
        }
        return false
    }
    //MARK: method to deposit money in the account.
    func depositAmount() {
        var amount:Double?
        print("Enter Amount You Want to Deposit : $ ")
        amount = Double(readLine()!)!
        print(": \(balance ?? 0.0)")
        balance = (balance ?? 0.0) + (amount ?? 0.0)
    }
    //MARK:method to withdraw money from the account.
    func withdrawAmount() {
        var amount:Double?
        print("Enter Amount You Want to withdraw : $ ")
        amount = Double(readLine()!)!
        if ((balance ?? 0.0) >= (amount ?? 0.0)) {
            balance = (balance ?? 0.0) - (amount ?? 0.0)
        } else {
            print("Transaction Failed due to Insufficient Balance.")
        }
    }
    //MARK:method to pay bills
    func payBill(amount:Double) {
        //print("Enter Amount You Want to withdraw : $ ")
       // amount = Double(readLine()!)!
        if ((balance ?? 0.0) >= (amount )) {
            balance = (balance ?? 0.0) - (amount)
        } else {
            print("Transaction Failed due to Insufficient Balance.")
        }
    }
    //MARK: Method for Transferring money into the Account.
    func transferAmount(amount:Double?){
        if((balance ?? 0.0) >= (amount ?? 0.0)){
            balance = (balance ?? 0.0) - (amount ?? 0.0)
            print("The amount of $ \(amount ?? 0.0) is Successfully transfered.")
            showAccount();
        } else {
            print("Insufficient funds")
        }
    }
    func writeToFile() -> String{
        return "Account Type : \(accountType ?? "") , Account Number : \(accountNumber ?? "") , Customer Name : \(accountName ?? ""), Balance : $ \(balance ?? 0.0)"
    }
}



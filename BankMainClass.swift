//
//  BankMainClass.swift
//  BankXYZ
//
//  Created by mac on 02/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
public class BankMainClass {
    func mainBanking(){
        let fileName = "AccountDetails.rtf"
        var filePath = ""
        
        // Fine documents directory on device
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        if dirs.count > 0 {
            let dir = dirs[0] //documents directory
            filePath = dir.appending("/" + fileName)
            print("Local path = \(filePath)")
        } else {
            print("Could not find local directory to store file")
            return
        }
        print("Welcome to the bank")
        print("How Many Customer You Want to Input : ")
        let cusNo = Int(readLine()!)!
        var bankObjArr = [Bank()]
        bankObjArr.removeAll()
        for _ in 0..<cusNo{
            let obj = Bank()
            bankObjArr.append(obj)
            obj.openAccount()
            let accDetails = obj.writeToFile()
            do {
                // Write contents to file
                try accDetails.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
            }
            catch let error as NSError {
                print("An error took place: \(error)")
            }
        }
        let ch:Int?
        
        
        print("Menu\n1. Display All\n2. Search Account\n3. Deposit\n4. Withdrawal\n5. Transfer\n6. Pay Bills\n7. Exit ")
        print("Your Choice :")
        
        ch = Int(readLine()!)!
        switch ch{
        case 1:
            for item in bankObjArr{
                item.showAccount()
            }
            break
        case 2:
            
            print("Enter Account Number You Want to Search: ")
            let accnt = String(readLine()!)
            var found = false
            for item in bankObjArr{
                found = item.searchAccount(account: accnt)
                if (found) {
                    break
                }
            }
            if (!found) {
                print("Account Does Not Exist..")
            }
            break;
            
        case 3:
            print("Enter the Account No : ")
            let accnt = String(readLine()!)
            var found = false
            for item in bankObjArr{
                found = item.searchAccount(account: accnt)
                if (found) {
                    item.depositAmount()
                    break
                }
            }
            if (!found) {
                print("Account Does Not Exist..")
            }
            break;
            
        case 4:
            print("Enter the Account No : ")
            let accnt = String(readLine()!)
            var found = false
            for item in bankObjArr{
                found = item.searchAccount(account: accnt)
                if (found) {
                    item.withdrawAmount()
                    break
                }
            }
            if (!found) {
                print("Account Does Not Exist..")
            }
            break;
            
        case 5:
            print("Enter the Account No : ")
            let accnt = String(readLine()!)
            var found = false
            for item in bankObjArr{
                found = item.searchAccount(account: accnt)
                if (found) {
                    print("Enter the amount you want to transfer : $ ")
                    let amount = Double(readLine()!)
                    item.transferAmount(amount: amount)
                    break;
                }
            }
            if (!found) {
                print("Account Does Not Exist..")
            }
            break;
            
        case 6:
            print("Enter the Account No : ")
            let accnt = String(readLine()!)
            var found = false
            for item in bankObjArr{
                found = item.searchAccount(account: accnt)
                if (found) {
                    print("Enter the bill amount : $ ")
                    let amount = Double(readLine()!)!
                    item.payBill(amount: amount)
                    break
                }
            }
            if (!found) {
                print("Account Does Not Exist..")
            }
            break;
        case 7:
            print("Exit ! Thank You.")
            break;
        default:
            print("Please enter input according to Data Type. Restart the program & Try Again !")
            break;
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

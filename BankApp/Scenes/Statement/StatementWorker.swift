//
//  StatementWorker.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright (c) 2019 Gabriel Faustino. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class StatementWorker{
    private var apiLayer = NetworkLayerAlamofire()
    
    func getUserStatement(for id: Int, success: ((Statement.Transactions.Response) -> Void)?, failure: ((Error) -> Void)? ) {
        let url = URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(id)")!
        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
        
        apiLayer.get(url, model: Statement.Transactions.Response.self, headers: headers) { result in
            switch result {
            case .success(let statementData):
                success?(statementData)
            case .failure(let error):
                failure?(error)
            }
        }
    }
}

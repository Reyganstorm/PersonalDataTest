//
//  ChildrenManger.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import Foundation

class ChildrenManger {
    
    static let shared = ChildrenManger()
    
    private init() {}
    
    private var countOfChildren = 0
    
    func addChildren() {
        if countOfChildren < 5 {
        countOfChildren += 1
        }
    }
    
    func deleteChildren() {
        if countOfChildren > 0 {
            countOfChildren -= 1
        }
    }
    
    func getChildrenCount() -> Int {
        countOfChildren
    }
    
}



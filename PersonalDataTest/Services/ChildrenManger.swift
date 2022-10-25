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
    
    private var children = [Child]()
    
    func addChildren() {
        if children.count < 5 {
            children.append(Child(name: "", age: ""))
        }
    }
    
    func deleteChildren(at index: Int) {
        if children.count > 0 {
            children.remove(at: index)
        }
    }
    
    func deleteAll() {
        children = [Child]()
    }
    
    func getChildrenCount() -> Int {
        children.count
    }
    
    func getChildForRework(at index: Int) -> Child {
        return children[index]
    }
    
}

class Child {
    var name: String
    var age: String
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}

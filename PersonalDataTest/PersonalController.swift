//
//  PersonalController.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import UIKit

class PersonalController: UIViewController {
    
    private let childrenCount = 5
    
    private let personalTableView: UITableView = {
        let table = UITableView()
        table.register(ChildrenTableViewCell.self,
                       forCellReuseIdentifier: ChildrenTableViewCell.identifier)
        table.register(PersonalDataHeader.self,
                       forHeaderFooterViewReuseIdentifier: PersonalDataHeader.identifier)
        table.backgroundColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(personalTableView)
        personalTableView.frame = view.bounds
        
        personalTableView.dataSource = self
        personalTableView.delegate = self
    }
    

}

extension PersonalController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: PersonalDataHeader.identifier) as! PersonalDataHeader
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        childrenCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ChildrenTableViewCell.identifier,
            for: indexPath) as! ChildrenTableViewCell
        cell.configure()
        return cell
    }
    
    
}

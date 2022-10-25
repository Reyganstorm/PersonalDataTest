//
//  PersonalController.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import UIKit

class PersonalController: UIViewController {
    
    private let storage = ChildrenManger.shared
    
    private let personalTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ChildrenTableViewCell.self,
                       forCellReuseIdentifier: ChildrenTableViewCell.identifier)
        table.register(PersonalDataHeader.self,
                       forHeaderFooterViewReuseIdentifier: PersonalDataHeader.identifier)
        table.register(DeleteAllChildFoother.self,
                       forHeaderFooterViewReuseIdentifier: DeleteAllChildFoother.identifier)
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
    
    @objc private func appendChild() {
        storage.addChildren()
        personalTableView.reloadData()
    }
    
    @objc private func deleteAllChild() {
        callActionSheet()
    }
    
    @objc private func deleteSelectChild() {
        personalTableView.reloadData()
    }
}

extension PersonalController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: PersonalDataHeader.identifier) as! PersonalDataHeader
        let addButtonIsHidden = storage.getChildrenCount() > 4
        cell.configure(childButton: addButtonIsHidden)
        cell.addTargetForAddChild(target: self, action: #selector(appendChild))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storage.getChildrenCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ChildrenTableViewCell.identifier,
            for: indexPath) as! ChildrenTableViewCell
        let index = indexPath.row
        let child = storage.getChildForRework(at: index)
        cell.configure(childIndex: index, name: child.name, age: child.age)
        cell.addTargetForDeleteChild(target: self, action: #selector(deleteSelectChild))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if storage.getChildrenCount() > 0 {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: DeleteAllChildFoother.identifier) as! DeleteAllChildFoother
        cell.configure()
        cell.addTargetForDeleteChild(target: self, action: #selector(deleteAllChild))
        return cell
        } else {
            return nil
        }
    }
}


extension PersonalController {
    func callActionSheet() {
        let actionSheet = UIAlertController(
            title: "Внимание",
            message: "Действительно ли вы хотите удалить все данные?",
            preferredStyle: .actionSheet
        )
        
        actionSheet.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { _ in
            self.storage.deleteAll()
            self.personalTableView.reloadData()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        present(actionSheet, animated: true)
    }
}

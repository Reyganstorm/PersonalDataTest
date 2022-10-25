//
//  PersonalTableViewCell.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import UIKit
import SnapKit

class ChildrenTableViewCell: UITableViewCell {
    
    static let identifier = "PersonalTableViewCell"
    
    private var childInd = -1

    private let nameView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        return view
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.addTopLable(text: "Имя")
        textField.text = ""
        textField.placeholder = "Enter"
        return textField
    }()
    
    private let ageView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        return view
    }()

    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.addTopLable(text: "Возраст")
        textField.text = ""
        textField.keyboardType = .decimalPad
        textField.placeholder = "Enter"
        return textField
    }()
    
    private let deleteChildButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Удалить", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        return button
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc private func deleteSelectChild() {
        print("Check del \(childInd)")
        ChildrenManger.shared.deleteChildren(at: childInd)
    }
    

    func configure(childIndex: Int, name: String, age: String) {
        selectionStyle = .none
        childInd = childIndex
        addViews()
        addConstraints()
        deleteChildButton.addTarget(self,
                                    action: #selector(deleteSelectChild),
                                    for: .touchUpInside)
        nameTextField.delegate = self
        ageTextField.delegate = self
        
        ageTextField.text = age
        nameTextField.text = name
    }
    
    private func addViews() {
        backgroundColor = .clear
        contentView.addSubview(nameView)
        nameView.addSubview(nameTextField)
        contentView.addSubview(ageView)
        ageView.addSubview(ageTextField)
        contentView.addSubview(deleteChildButton)
    }
    
    private func addConstraints() {
        
        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(15)
        }
        
        deleteChildButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameView)
            make.left.equalTo(nameView.snp.right).offset(20)
            make.right.lessThanOrEqualToSuperview().offset(-20)
        }
        
        ageView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.right.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(15)
        }
    }
}

extension ChildrenTableViewCell {
    func addTargetForDeleteChild(target: Any, action: Selector) {
        deleteChildButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension ChildrenTableViewCell: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == ageTextField {
            let child = ChildrenManger.shared.getChildForRework(at: childInd)
            child.age = textField.text ?? ""
            print(child.age)
        } else {
            let child = ChildrenManger.shared.getChildForRework(at: childInd)
            child.name = textField.text ?? ""
            print(child.name)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
}

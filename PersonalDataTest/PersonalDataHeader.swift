//
//  PersonalDataHeader.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import UIKit

class PersonalDataHeader: UITableViewHeaderFooterView {
    
    static let identifier = "PersonalDataHeader"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        return label
    }()
    
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
        textField.text = "Petr"
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
        textField.text = "99"
        return textField
    }()
    
    private let addChildrenLabel: UILabel = {
        let label = UILabel()
        label.text = "Дети (макс. 5)"
        return label
    }()
    
    func configure() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(nameView)
        nameView.addSubview(nameTextField)
        addSubview(ageView)
        ageView.addSubview(ageTextField)
        addSubview(addChildrenLabel)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(15)
        }
        
        ageView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.centerX.equalToSuperview()
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.right.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(15)
        }
        
        addChildrenLabel.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(30)
            make.left.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}

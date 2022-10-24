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
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    private let addChildButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle(" Добавить ребенка", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.link.cgColor
        button.layer.borderWidth = 2
        return button
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
        addSubview(addChildButton)
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
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        addChildButton.snp.makeConstraints { make in
            make.top.equalTo(ageView.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            if (screenWidth - 255) < 119 {
                make.left.equalToSuperview().offset(20)
            } else {
                make.left.greaterThanOrEqualTo(addChildrenLabel.snp.right).offset(15)
                make.bottom.equalToSuperview().offset(-20)
            }
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        addChildrenLabel.snp.makeConstraints { make in
            if (screenWidth - 255) < 119 {
                make.top.equalTo(addChildButton.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(20)
                make.bottom.equalToSuperview().offset(-20)
            } else {
                make.centerY.equalTo(addChildButton)
                make.left.equalTo(titleLabel)
                make.width.equalTo(120)
            }
        }
    }
}

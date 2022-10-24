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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        backgroundColor = .clear
        contentView.addSubview(nameView)
        nameView.addSubview(nameTextField)
        contentView.addSubview(ageView)
        ageView.addSubview(ageTextField)
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

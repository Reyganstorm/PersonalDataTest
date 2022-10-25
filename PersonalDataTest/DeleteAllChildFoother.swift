//
//  DeleteAllChildFoother.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 25.10.2022.
//

import UIKit

class DeleteAllChildFoother: UITableViewHeaderFooterView {

    static let identifier = "DeleteAllChildFoother"

    private let deleteChildButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Очистить ", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    func configure() {
        contentView.addSubview(deleteChildButton)
        
        deleteChildButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(240)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-400)
        }
    }
    
    func addTargetForDeleteChild(target: Any, action: Selector) {
        deleteChildButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

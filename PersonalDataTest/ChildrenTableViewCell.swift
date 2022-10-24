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

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .link
        view.layer.cornerRadius = 10
        return view
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
        addSubview(backView)
    }
    
    private func addConstraints() {
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7.5)
            make.bottom.equalToSuperview().offset(-7.5)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    

}

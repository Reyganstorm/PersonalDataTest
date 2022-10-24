//
//  UITextField + ext.swift
//  PersonalDataTest
//
//  Created by Руслан Штыбаев on 24.10.2022.
//

import Foundation
import UIKit
import SnapKit

extension UITextField {
    
    func addTopLable(text: String) {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = UIColor(red: 0.512, green: 0.512, blue: 0.512, alpha: 1)
        lable.text = text
        self.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalTo(self.snp.top).offset(-5)
        }
    }
}

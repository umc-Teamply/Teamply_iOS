//
//  TendencyHeader.swift
//  Teamply
//
//  Created by 아라 on 2023/02/05.
//

import UIKit

class TendencyHeader: UICollectionReusableView {
    lazy var titleLabel:UILabel = {
           let label = UILabel()
            label.text = ""
            label.font = .sub1
            label.textColor = .basic2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupUI()
        }
        /// 레이아웃 세팅
        func setupUI(){
            self.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24) ,
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

//
//  TendencyCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/04.
//

import UIKit

class TendencyCollectionViewCell: UICollectionViewCell {
    lazy var tendencyLabel:UILabel = {
        let label = UILabel()
        label.font = .cap3
        label.textColor = .basic2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        button.widthAnchor.constraint(equalToConstant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 10).isActive = true
        //button.addTarget(self, action: #selector(deleteTendencyAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.gray3, for: .normal)
        button.titleLabel!.font = .cap3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTendencyTag() {
        contentView.makeRound(radius: 5)
        contentView.layer.borderColor = UIColor.gray4?.cgColor
        contentView.layer.borderWidth = 1
        contentView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        self.contentView.addSubview(tendencyLabel)
        
        NSLayoutConstraint.activate([
            tendencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            tendencyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tendencyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
    }
    
    func setDeleteButton() {
        self.contentView.addSubview(deleteButton)

        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: tendencyLabel.trailingAnchor, constant: 10),
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setAddButton() {
        self.contentView.addSubview(addButton)
        
        contentView.layer.borderColor = UIColor.gray3?.cgColor
        contentView.layer.borderWidth = 1
        contentView.makeRound(radius: 5)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    
}

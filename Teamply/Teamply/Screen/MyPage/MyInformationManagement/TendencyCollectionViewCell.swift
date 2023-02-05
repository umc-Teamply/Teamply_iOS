//
//  TendencyCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/04.
//

import UIKit

class TendencyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tendencyLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .team3
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

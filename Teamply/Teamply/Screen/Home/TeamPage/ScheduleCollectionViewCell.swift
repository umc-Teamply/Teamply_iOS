//
//  ScheduleCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/17.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

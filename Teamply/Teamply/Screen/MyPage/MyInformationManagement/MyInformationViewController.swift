//
//  MyInformationViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/03.
//

import UIKit

class MyInformationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tendencyLabel: UILabel!
    @IBOutlet weak var tendencyView: UIView!
    @IBOutlet weak var participationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func labelInit() {
        titleLabel.text = "내 정보 관리"
        titleLabel.font = .head1
        titleLabel.textColor = .basic2
        
        tendencyLabel.text = "나의 성향"
        tendencyLabel.font = .sub1
        tendencyLabel.textColor = .basic2
        
        participationLabel.text = "프로젝트 참여도"
        participationLabel.font = .sub1
        participationLabel.textColor = .basic2
    }

    
}

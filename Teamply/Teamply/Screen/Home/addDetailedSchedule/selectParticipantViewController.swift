//
//  selectParticipantViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/09.
//

import UIKit

class selectParticipantViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var user0Label: UILabel!
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user3Label: UILabel!
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var selectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectStyle()

        // Do any additional setup after loading the view.
    }
    
    func selectStyle(){
        titleLabel.text = "누가 할 건지 선택해주세요"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        user0Label.text = "이프로"
        user0Label.font = .cap2
        user0Label.textColor = .basic2
        
        user2Label.text = "박미룸"
        user2Label.font = .cap2
        user2Label.textColor = .basic2
        
        user1Label.text = "김늦음"
        user1Label.font = .cap2
        user1Label.textColor = .basic2
        
        user3Label.text = "강꼼꼼"
        user3Label.font = .cap2
        user3Label.textColor = .basic2
        
        selectButton.makeRound(radius: 10)
        selectLabel.text = "선택 완료"
        selectLabel.font = .btn
        selectLabel.textColor = .basic1
    }
}

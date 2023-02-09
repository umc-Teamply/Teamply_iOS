//
//  selectParticipantViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/09.
//

import UIKit

class selectParticipantViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var user0Button: UIImageView!
    @IBOutlet weak var user2Button: UIImageView!
    @IBOutlet weak var user1Button: UIImageView!
    @IBOutlet weak var user3Button: UIImageView!
    
    @IBOutlet weak var user0Label: UILabel!
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user3Label: UILabel!
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var selectLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectStyle()
        user0Button.image = UIImage(named: "user0")
        user2Button.image = UIImage(named: "user2")
        user1Button.image = UIImage(named: "user1")
        user3Button.image = UIImage(named: "user3")
        
        
    }
    
    func selectStyle(){
        titleLabel.text = "누가 할 건지 선택해주세요"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        user0Label.text = "이프로"
        user0Label.font = .cap2
        user0Label.textColor = .basic2
        user0Button.layer.opacity = 0.3
        
        user2Label.text = "박미룸"
        user2Label.font = .cap2
        user2Label.textColor = .basic2
        user2Button.layer.opacity = 0.3
        
        user1Label.text = "김늦음"
        user1Label.font = .cap2
        user1Label.textColor = .basic2
        user1Button.layer.opacity = 0.3
        
        user3Label.text = "강꼼꼼"
        user3Label.font = .cap2
        user3Label.textColor = .basic2
        user3Button.layer.opacity = 0.3
        
        selectButton.makeRound(radius: 10)
        selectLabel.text = "선택 완료"
        selectLabel.font = .btn
        selectLabel.textColor = .basic1
    }
    
    @IBAction func tapUser0Button(_ sender: Any) {
        user0Button.layer.opacity = 1.0
    }
    
    @IBAction func tapUser2Button(_ sender: Any) {
        user2Button.layer.opacity = 1.0
    }
    
    @IBAction func tapUser1Button(_ sender: Any) {
        user1Button.layer.opacity = 1.0
    }
    
    @IBAction func tapUser3Button(_ sender: Any) {
        user3Button.layer.opacity = 1.0
    }
}

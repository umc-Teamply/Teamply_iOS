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
    
    @IBOutlet weak var user0Label: UILabel!
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user1Label: UILabel!

    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var selectLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectStyle()
        user0Button.image = UIImage(named: "duck")
        user0Button.makeRound(radius: 31.5)
        user0Button.isUserInteractionEnabled = true
        user2Button.image = UIImage(named: "roseok")
        user1Button.makeRound(radius: 31.5)
        user1Button.isUserInteractionEnabled = true
        user1Button.image = UIImage(named: "prince")
        user2Button.makeRound(radius: 31.5)
        user2Button.isUserInteractionEnabled = true
        
    }
    
    func selectStyle(){
        titleLabel.text = "누가 할 건지 선택해주세요"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        user0Label.text = "성덕선"
        user0Label.font = .cap2
        user0Label.textColor = .basic2
        //user0Button.layer.opacity = 0.3
        
        user2Label.text = "장미옥"
        user2Label.font = .cap2
        user2Label.textColor = .basic2
        //user2Button.layer.opacity = 0.3
        
        user1Label.text = "왕자현"
        user1Label.font = .cap2
        user1Label.textColor = .basic2
        //user1Button.layer.opacity = 0.3
        
        selectButton.makeRound(radius: 10)
        selectButton.setTitle("선택완료", for: .normal)
        selectButton.tintColor = .basic1
        selectButton.setTitleColor(.basic1, for: .normal)
        selectButton.titleLabel!.font = .btn
        
    }
    
    @IBAction func tapUser0Button(_ sender: Any) {
        user0Button.layer.opacity = 0.5
    }
    
    @IBAction func tapUser2Button(_ sender: Any) {
        user2Button.layer.opacity = 0.5
    }
    
    @IBAction func tapUser1Button(_ sender: Any) {
        user1Button.layer.opacity = 0.5
    }
    
}

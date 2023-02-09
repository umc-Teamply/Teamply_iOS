//
//  selectParticipantViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/09.
//

import UIKit

class selectParticipantViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var user0Button: UIButton!
    @IBOutlet weak var user2Button: UIButton!
    @IBOutlet weak var user1Button: UIButton!
    @IBOutlet weak var user3Button: UIButton!
    
    @IBOutlet weak var user0Label: UILabel!
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user3Label: UILabel!
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var selectLabel: UILabel!
    
    let user0: UIImage = UIImage(named: "user0")!
    let user2: UIImage = UIImage(named: "user2")!
    let user1: UIImage = UIImage(named: "user1")!
    let user3: UIImage = UIImage(named: "user3")!
    
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
        user0Button.setImage(user0, for: UIControl.State.normal)
        user0Button.layer.opacity = 0.3
        
        user2Label.text = "박미룸"
        user2Label.font = .cap2
        user2Label.textColor = .basic2
        user2Button.setImage(user2, for: UIControl.State.normal)
        user2Button.layer.opacity = 0.3
        
        user1Label.text = "김늦음"
        user1Label.font = .cap2
        user1Label.textColor = .basic2
        user1Button.setImage(user1, for: UIControl.State.normal)
        user1Button.layer.opacity = 0.3
        
        user3Label.text = "강꼼꼼"
        user3Label.font = .cap2
        user3Label.textColor = .basic2
        user3Button.setImage(user3, for: UIControl.State.normal)
        user3Button.layer.opacity = 0.3
        
        selectButton.makeRound(radius: 10)
        selectLabel.text = "선택 완료"
        selectLabel.font = .btn
        selectLabel.textColor = .basic1
    }
    
    
    @IBAction func clickuser0Button(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    @IBAction func clickuser2Button(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    @IBAction func clickuser1Button(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    @IBAction func clickuser3Button(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
}

//
//  selectProjectColorViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/24.
//

import UIKit
import SnapKit

class selectProjectColorViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var team1colorImage: UIImageView!
    @IBOutlet weak var team2ColorImage: UIImageView!
    @IBOutlet weak var team3ColorImage: UIImageView!
    @IBOutlet weak var team4ColorImage: UIImageView!
    @IBOutlet weak var team5ColorImage: UIImageView!
    @IBOutlet weak var team6ColorImage: UIImageView!
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var colorStactView: UIStackView!
    
    let colors: [UIColor] = [.black, .team1!, .team2!, .team3!, .team4!, .team5!, .team6!]
    var index = 0
    var colorHandler: ((UIColor) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    func setInit() {
        titleLabel.text = "프로젝트 색상"
        titleLabel.font = .cap1
        titleLabel.textColor = .basic2
    
        selectButton.setTitle("선택 완료", for: .normal)
        selectButton.setTitleColor(.basic1, for: .normal)
        selectButton.backgroundColor = .basic2
        selectButton.titleLabel?.font = .btn
        selectButton.makeRound(radius: 10)
    }
    
    
    @IBAction func selectProjectColor(_ sender: Any) {
        colorHandler?(self.colors[index])
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func team1ColorTap(_ sender: UITapGestureRecognizer) {
        index = 1
    }
    @IBAction func team2ColorTap(_ sender: UITapGestureRecognizer) {
        index = 2
    }
    @IBAction func team3ColorTap(_ sender: UITapGestureRecognizer) {
        index = 3
    }
    @IBAction func team4ColorTap(_ sender: UITapGestureRecognizer) {
        index = 4
    }
    @IBAction func team5ColorTap(_ sender: UITapGestureRecognizer) {
        index = 5
    }
    @IBAction func team6ColorTap(_ sender: UITapGestureRecognizer) {
        index = 6
    }
}

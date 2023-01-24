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

    }
    
    @IBAction func team1ColorTap(_ sender: Any) {
    }
    @IBAction func team2ColorTap(_ sender: Any) {
    }
    @IBAction func team3ColorTap(_ sender: Any) {
    }
    @IBAction func team4ColorTap(_ sender: Any) {
    }
    @IBAction func team5ColorTap(_ sender: Any) {
        
    }
    @IBAction func team6ColorTap(_ sender: Any) {
    }
}

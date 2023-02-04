//
//  MyInformationViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/03.
//

import UIKit

class MyInformationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tendencyLabel: UILabel!
    @IBOutlet weak var tendencyView: UIView!
    @IBOutlet weak var participationLabel: UILabel!
    //@IBOutlet weak var addTendencyButton: UIButton!
    @IBOutlet weak var integrityTitleLabel: UILabel!
    @IBOutlet weak var integrityValueLabel: UILabel!
    @IBOutlet weak var integrityView: UIView!
    @IBOutlet weak var participationTitleLabel: UILabel!
    @IBOutlet weak var participationValueLabel: UILabel!
    @IBOutlet weak var participationView: UIView!
    @IBOutlet weak var contributionTitleLabel: UILabel!
    @IBOutlet weak var contributionValueLabel: UILabel!
    @IBOutlet weak var contributionView: UIView!
    @IBOutlet weak var profileChangeButton: UIButton!
    @IBOutlet weak var tendencyCollectionView: UICollectionView!
    
    let tendencyCell = "TendencyCell"
    
    let myTendencyList:[String] = ["ESFJ", "시간약속 철저해요", "학점 A+ 목표", "PPT 자신 있어요"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
    }
    
    func setUserInfo() {
        userNameLabel.text = "이프로"
        userNameLabel.font = .sub1
        userNameLabel.textColor = .basic2
        
    }
    func componentInit() {
        titleLabel.text = "내 정보 관리"
        titleLabel.font = .head1
        titleLabel.textColor = .basic2
        
        tendencyLabel.text = "나의 성향"
        tendencyLabel.font = .sub1
        tendencyLabel.textColor = .basic2
        
        participationLabel.text = "프로젝트 참여도"
        participationLabel.font = .sub1
        participationLabel.textColor = .basic2
        
        profileChangeButton.setTitle("프로필 변경", for: .normal)
        profileChangeButton.tintColor = .gray3
        profileChangeButton.titleLabel?.font = .body
        
//        addTendencyButton.setTitle("추가하기", for: .normal)
//        addTendencyButton.tintColor = .gray3
//        addTendencyButton.titleLabel?.font = .cap3
//        addTendencyButton.layer.borderColor = UIColor.gray3?.cgColor
//        addTendencyButton.layer.borderWidth = 1
//        addTendencyButton.makeRound(radius: 5)
        
        integrityView.makeRound(radius: 14)
        integrityTitleLabel.text = "누적 성실도"
        integrityTitleLabel.font = .cap3
        integrityTitleLabel.textColor = .basic2
        
        participationView.makeRound(radius: 14)
        participationTitleLabel.text = "누적 참여도"
        participationTitleLabel.font = .cap3
        participationTitleLabel.textColor = .basic2
        
        contributionView.makeRound(radius: 14)
        contributionTitleLabel.text = "누적 기여도"
        contributionTitleLabel.font = .cap3
        contributionTitleLabel.textColor = .basic2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myTendencyList.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: tendencyCell, for: indexPath) as! TendencyCollectionViewCell
        
        return cell
    }
    
}

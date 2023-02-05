//
//  MyInformationViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/03.
//

import UIKit

class MyInformationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    let myTendencyList:[String] = ["시간약속 철저해요", "학점 A+ 목표", "PPT 자신 있어요","ESFJ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInfo()
        componentInit()
        setCollectionView()
    }
    
    func isLastCell(idx: Int) -> Bool {
        if idx == myTendencyList.count{
            return true
        }
        return false
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
        
        //        tendencyLabel.text = "나의 성향"
        //        tendencyLabel.font = .sub1
        //        tendencyLabel.textColor = .basic2
        
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
    
    func setCollectionView() {
        tendencyCollectionView.delegate = self
        tendencyCollectionView.dataSource = self
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 9
        flowLayout.sectionInset = .init(top: 19, left: 24, bottom: 39, right: 24)
        flowLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 53)
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        tendencyCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        tendencyCollectionView.register(TendencyCollectionViewCell.self, forCellWithReuseIdentifier: tendencyCell)
        
        tendencyCollectionView.register(TendencyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TendencyHeader")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myTendencyList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tendencyCell, for: indexPath) as! TendencyCollectionViewCell
        if isLastCell(idx: indexPath.row) {
            cell.setAddButton()
        } else {
            cell.tendencyLabel.text = myTendencyList[indexPath.row]
            //cell.tendencyLabel.sizeToFit()
            cell.setTendencyTag()
            cell.setDeleteButton()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isLastCell(idx: indexPath.row){
            return CGSize(width: 71, height: 28)
        }
        else {
            let item = myTendencyList[indexPath.row]
            let cellWidth = item.size(withAttributes: [.font: UIFont.cap3]).width + 46
            
            return CGSize(width: cellWidth, height: 28)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TendencyHeader", for: indexPath) as! TendencyHeader
            header.titleLabel.text = "나의 성향"
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
}

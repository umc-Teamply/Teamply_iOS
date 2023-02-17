//
//  codeViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/01/31.
//

import UIKit

class codeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var codeTitleLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeMessageLabel: UILabel!
    @IBOutlet weak var codePopUpView: UIView!
    @IBOutlet weak var codeCopyButton: UIButton!
    
    var code: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCodeStye()
    }
    
    func setCodeStye() {
        codeTitleLabel.text = "'브랜드경험 디자인' 초대코드"
        codeTitleLabel.font = .body
        codeTitleLabel.textColor = .basic2
        
        codeLabel.text = code
        codeLabel.font = UIFont(name: "NotoSansKR-Medium", size: 36.0)!
        codeLabel.textColor = .basic2
        
        codeMessageLabel.text = "초대코드를 친구에게 공유해주세요"
        codeMessageLabel.font = .cap2
        codeMessageLabel.textColor = .gray3
        
        codePopUpView.makeRound(radius: 7)
        codeCopyButton.makeRound(radius: 2)
    }
    
    // MARK: - IBAction
    @IBAction func closeViewButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}

//
//  selectProjectColorViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/24.
//

import UIKit
import SnapKit

class selectColorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var team1ColorView: UIView!
    @IBOutlet weak var team2ColorView: UIView!
    @IBOutlet weak var team3ColorView: UIView!
    @IBOutlet weak var team4ColorView: UIView!
    @IBOutlet weak var team5ColorView: UIView!
    @IBOutlet weak var team6ColorView: UIView!
    
    @IBOutlet weak var border1View: UIView!
    @IBOutlet weak var border2View: UIView!
    @IBOutlet weak var border3View: UIView!
    @IBOutlet weak var border4View: UIView!
    @IBOutlet weak var border5View: UIView!
    @IBOutlet weak var border6View: UIView!
    @IBOutlet weak var colorStactView: UIStackView!
    
    // MARK: - Properties
    var colors: [UIColor] = []
    var colorData: [String] = []
    var projectInfo: [ProjectInfo] = []
    var index = 0
    var colorHandler: ((UIColor) -> ())?
    var selectColor: UIColor!
    let checkImage: UIImageView = {
        let check = UIImageView()
        
        check.image = UIImage(named: "check")
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getColorInfo()
        setInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if index != 0{
            setBorderView(idx: index)
        }
    }
    
    // MARK: - Method
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
    
    func borderInit() {
        border1View.backgroundColor = .basic1
        border2View.backgroundColor = .basic1
        border3View.backgroundColor = .basic1
        border4View.backgroundColor = .basic1
        border5View.backgroundColor = .basic1
        border6View.backgroundColor = .basic1
        
        border1View.makeRound(radius: 5)
        border2View.makeRound(radius: 5)
        border3View.makeRound(radius: 5)
        border4View.makeRound(radius: 5)
        border5View.makeRound(radius: 5)
        border6View.makeRound(radius: 5)
        
        border1View.layer.borderWidth = 2
        border2View.layer.borderWidth = 2
        border3View.layer.borderWidth = 2
        border4View.layer.borderWidth = 2
        border5View.layer.borderWidth = 2
        border6View.layer.borderWidth = 2
        
        border1View.layer.borderColor = UIColor.basic1?.cgColor
        border2View.layer.borderColor = UIColor.basic1?.cgColor
        border3View.layer.borderColor = UIColor.basic1?.cgColor
        border4View.layer.borderColor = UIColor.basic1?.cgColor
        border5View.layer.borderColor = UIColor.basic1?.cgColor
        border6View.layer.borderColor = UIColor.basic1?.cgColor
    }
    
    func colorViewInit() {
        var colorView: UIView!
        for c in colors {
            switch c {
            case .team1! :
                colorView = team1ColorView
                break
            case .team2! :
                colorView = team2ColorView
                break
            case .team3! :
                colorView = team3ColorView
                break
            case .team4! :
                colorView = team4ColorView
                break
            case .team5! :
                colorView = team5ColorView
                break
            case .team6! :
                colorView = team6ColorView
                break
            default:
                break
            }
            colorView.backgroundColor = .gray0
            colorView.makeRound(radius: 5)
            colorView.isUserInteractionEnabled = false
        }
    }
    
    func availableColorInit() {
        team1ColorView.backgroundColor = .team1
        team1ColorView.makeRound(radius: 5)
        
        team2ColorView.backgroundColor = .team2
        team2ColorView.makeRound(radius: 5)
        
        team3ColorView.backgroundColor = .team3
        team3ColorView.makeRound(radius: 5)
        
        team4ColorView.backgroundColor = .team4
        team4ColorView.makeRound(radius: 5)
        
        team5ColorView.backgroundColor = .team5
        team5ColorView.makeRound(radius: 5)
        
        team6ColorView.backgroundColor = .team6
        team6ColorView.makeRound(radius: 5)
    }
    
    func setViewAvailable() {
        team1ColorView.isUserInteractionEnabled = true
        team2ColorView.isUserInteractionEnabled = true
        team3ColorView.isUserInteractionEnabled = true
        team4ColorView.isUserInteractionEnabled = true
        team5ColorView.isUserInteractionEnabled = true
        team6ColorView.isUserInteractionEnabled = true
    }
    
    func setBorderView(idx: Int) {
        borderInit()
        
        var colorView: UIView!
        var borderView: UIView!
        
        switch idx {
        case 1:
            colorView = team1ColorView
            borderView = border1View
            break
        case 2:
            colorView = team2ColorView
            borderView = border2View
            break
        case 3:
            colorView = team3ColorView
            borderView = border3View
            break
        case 4:
            colorView = team4ColorView
            borderView = border4View
            break
        case 5:
            colorView = team5ColorView
            borderView = border5View
            break
        case 6:
            colorView = team6ColorView
            borderView = border6View
            break
        default:
            break
        }
        borderView.layer.borderColor = colorView.backgroundColor?.cgColor
        
        colorView.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
    
    func StringToUIColor() {
        for c in colorData {
            colors.append(UIColor(named: c)!)
        }
        borderInit()
        availableColorInit()
        setViewAvailable()
        colorViewInit()
    }
    
    func setProjectColors() {
        for p in projectInfo {
            colorData.append(p.color)
        }
        StringToUIColor()
    }
    
    // MARK: - IBAction
    @IBAction func selectProjectColor(_ sender: Any) {
        if selectColor != nil {
            colorHandler?(self.selectColor)
            self.presentingViewController?.dismiss(animated: true)
        }
    }
    
    // MARK: - Gesture
    @IBAction func team1ColorTap(_ sender: UITapGestureRecognizer) {
        index = 1
        setBorderView(idx: index)
        selectColor = .team1
    }
    @IBAction func team2ColorTap(_ sender: UITapGestureRecognizer) {
        index = 2
        setBorderView(idx: index)
        selectColor = .team2
    }
    @IBAction func team3ColorTap(_ sender: UITapGestureRecognizer) {
        index = 3
        setBorderView(idx: index)
        selectColor = .team3
    }
    @IBAction func team4ColorTap(_ sender: UITapGestureRecognizer) {
        index = 4
        setBorderView(idx: index)
        selectColor = .team4
    }
    @IBAction func team5ColorTap(_ sender: UITapGestureRecognizer) {
        index = 5
        setBorderView(idx: index)
        selectColor = .team5
    }
    @IBAction func team6ColorTap(_ sender: UITapGestureRecognizer) {
        index = 6
        setBorderView(idx: index)
        selectColor = .team6
    }
}

extension selectColorViewController {
    func getColorInfo() {
        AddProjectAPI.shared.getcolorInfo { [weak self] colorData in
            guard let infoData = colorData else { return }
            let info = infoData.data?.result
            self?.projectInfo = info!
            self?.setProjectColors()
        }
    }
}

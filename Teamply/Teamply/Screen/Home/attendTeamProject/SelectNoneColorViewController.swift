//
//  SelectNoneColorViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/02.
//

import UIKit

class SelectNoneColorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var border1View: UIView!
    @IBOutlet weak var border2View: UIView!
    @IBOutlet weak var border3View: UIView!
    @IBOutlet weak var border4View: UIView!
    @IBOutlet weak var border5View: UIView!
    @IBOutlet weak var border6View: UIView!
    
    @IBOutlet weak var color1View: UIView!
    @IBOutlet weak var color2View: UIView!
    @IBOutlet weak var color3View: UIView!
    @IBOutlet weak var color4View: UIView!
    @IBOutlet weak var color5View: UIView!
    @IBOutlet weak var color6View: UIView!
    
    @IBOutlet weak var selectButton: UIButton!
    
    // MARK: - Properties
    var index: Int = 0
    var colors: [UIColor] = []
    var colorData: [String] = []
    var selectColor: String!
    var projectInfo: [ProjectInfo] = []
    var code: String!
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
        comonentInit()

    }
    // MARK: - Method
    func comonentInit() {
        titleLabel.text = "프로젝트 색상"
        titleLabel.font = .cap1
        titleLabel.textColor = .basic2
    
        selectButton.setTitle("완료", for: .normal)
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
                colorView = color1View
                break
            case .team2! :
                colorView = color2View
                break
            case .team3! :
                colorView = color3View
                break
            case .team4! :
                colorView = color4View
                break
            case .team5! :
                colorView = color5View
                break
            case .team6! :
                colorView = color6View
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
        color1View.backgroundColor = .team1
        color1View.makeRound(radius: 5)
        
        color2View.backgroundColor = .team2
        color2View.makeRound(radius: 5)
        
        color3View.backgroundColor = .team3
        color3View.makeRound(radius: 5)
        
        color4View.backgroundColor = .team4
        color4View.makeRound(radius: 5)
        
        color5View.backgroundColor = .team5
        color5View.makeRound(radius: 5)
        
        color6View.backgroundColor = .team6
        color6View.makeRound(radius: 5)
    }
    
    func setViewAvailable() {
        color1View.isUserInteractionEnabled = true
        color2View.isUserInteractionEnabled = true
        color3View.isUserInteractionEnabled = true
        color4View.isUserInteractionEnabled = true
        color5View.isUserInteractionEnabled = true
        color6View.isUserInteractionEnabled = true
    }
    
    func setBorderView(idx: Int) {
        borderInit()
        
        var colorView: UIView!
        var borderView: UIView!
        
        switch idx {
        case 1:
            colorView = color1View
            borderView = border1View
            break
        case 2:
            colorView = color2View
            borderView = border2View
            break
        case 3:
            colorView = color3View
            borderView = border3View
            break
        case 4:
            colorView = color4View
            borderView = border4View
            break
        case 5:
            colorView = color5View
            borderView = border5View
            break
        case 6:
            colorView = color6View
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
    
    func setProjectColors() {
        for p in projectInfo {
            colorData.append(p.color)
        }
        StringToUIColor()
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
    
    // MARK: - IBAction
    @IBAction func attendProject(_ sender: Any) {
        postAttendProject()
    }
    
    // MARK: - Gesture
    @IBAction func color1Tap(_ sender: UITapGestureRecognizer) {
        index = 1
        setBorderView(idx: index)
        selectColor = "team1"
    }
    @IBAction func color2Tap(_ sender: UITapGestureRecognizer) {
        index = 2
        setBorderView(idx: index)
        selectColor = "team2"
    }
    @IBAction func color3Tap(_ sender: UITapGestureRecognizer) {
        index = 3
        setBorderView(idx: index)
        selectColor = "team3"
    }
    @IBAction func color4Tap(_ sender: UITapGestureRecognizer) {
        index = 4
        setBorderView(idx: index)
        selectColor = "team4"
    }
    @IBAction func color5Tap(_ sender: UITapGestureRecognizer) {
        index = 5
        setBorderView(idx: index)
        selectColor = "team5"
    }
    @IBAction func color6Tap(_ sender: UITapGestureRecognizer) {
        index = 6
        setBorderView(idx: index)
        selectColor = "team6"
    }
}

extension SelectNoneColorViewController {
    func getColorInfo() {
        AddProjectAPI.shared.getcolorInfo { [weak self] colorData in
            guard let infoData = colorData else { return }
            let info = infoData.data?.result
            self?.projectInfo = info!
            self?.setProjectColors()
        }
    }
    
    func postAttendProject() {
        guard var inviteCode = self.code else { return }
        guard var color = self.selectColor else { return }
        
        inviteCode = inviteCode.addSingleQuote(s: inviteCode)
        color = color.addSingleQuote(s: color)

        let attendRequest = AttendProjectRequest(inviteCode: inviteCode, color: color)
        
        AddProjectAPI.shared.attendProject(param: attendRequest) { result, error in
            if let error = error {
                print(error)
            } else {
                if self.selectColor != nil {
                    self.view.window?.rootViewController?.dismiss(animated: false, completion: {
                        let homeVC = HomeViewController()
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController?.present(homeVC, animated: true)
                    })
                }
                NotificationCenter.default.post(name: NSNotification.Name("DismissAttendView"), object: nil, userInfo: nil)
            }
            
        }
    }
}

//
//  TabmanViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/31.
//

import UIKit
import Tabman
import Pageboy

class TabManViewController: TabmanViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tabView: UIView!
    
    // MARK: - Properties
    private var tabViewController: [UIViewController] = []
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let inProgressVC = UIStoryboard.init(name: "InProgressTab", bundle: nil).instantiateViewController(withIdentifier: "InProgressVC") as! InProgressViewController
        let completedVC = UIStoryboard.init(name: "CompletedTab", bundle: nil).instantiateViewController(withIdentifier: "CompletedVC") as! CompletedViewController
        
        tabViewController.append(inProgressVC)
        tabViewController.append(completedVC)
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
                
        //탭바 레이아웃 설정
        bar.layout.transitionStyle = .progressive
        bar.layout.alignment = .centerDistributed
        bar.layout.interButtonSpacing = 20

        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = .basic1
                
        //간격설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0)
                
        //버튼 글시 커스텀
        bar.buttons.customize{
            (button)
            in
            button.tintColor = .gray2
            button.selectedTintColor = .basic2
            button.font = .sub2
        }
        //indicator
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.overscrollBehavior = .none
        bar.indicator.tintColor = .basic2
        bar.layout.contentMode = .fit
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
}

extension TabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "진행 중인 팀플")
        case 1:
            return TMBarItem(title: "완료된 팀플")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return tabViewController.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return tabViewController[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return .at(index: 0)
    }
}

//
//  MoreViewController.swift
//  Facebook_clone
//
//  Created by Steven on 2019/8/11.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

let moreCellId = "cellId"

class MoreViewController: UITableViewController {

    var moreCells = [More]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupMoreCells()
        tableView.separatorStyle = .none
    }
    
    func setupNavigationBar() {
        
        //custom title alignment
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "功能表"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 28)
            return label
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        //nav search buttons
        let searchButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "timeline_facebook_navsearch_icon80x80_"), for: .normal)
            
            return button
        }()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton)]
    }
    
    let moreCellIconAssets = [
        "Steven": "profile",
        "銘傳大學": "more_facebook_club_icon85x85_",
        "104.cce 乙班": "more_facebook_club_icon85x85_",
        "270度影像後照鏡": "more_facebook_club_icon85x85_",
        "Oculus": "more_facebook_oculus_icon85x85_",
        "朋友": "more_facebook_friends_icon85x85_",
        "社團": "more_facebook_club_colored_icon85x85_",
        "Marketplace": "more_facebook_marketplace_icon85x85_",
        "Watch 影片": "more_facebook_watch_icon85x85_",
        "活動": "more_facebook_events_icon85x85_",
        "動態回顧": "more_facebook_timelinereplay_icon85x85_",
        "我的珍藏": "more_facebook_entreasure_icon85x85_",
        "粉絲專頁": "more_facebook_fanpage_icon85x85_",
        "顯示更多": "more_facebook_displaymore_icon85x85_",
        "協助和支援": "more_facebook_support_icon85x85_",
        "設定和隱私": "more_facebook_settings_icon85x85_",
        "登出": "more_facebook_logout_icon85x85_",
    ]
    
    func setupMoreCells() {
        tableView.register(MoreCell.self, forCellReuseIdentifier: moreCellId)
        
        let moreCell1 = More()
        moreCell1.labelName = "Steven"
        moreCell1.iconImageName = "profile"
        moreCell1.detailText = ""
        moreCell1.hasAccessoryView = false
        moreCells.append(moreCell1)
        
        let moreCell2 = More()
        moreCell2.labelName = "銘傳大學"
        moreCell2.iconImageName = "more_facebook_club_icon85x85_"
        moreCell2.detailText = ""
        moreCell2.hasAccessoryView = false
        moreCells.append(moreCell2)
        
        let moreCell3 = More()
        moreCell3.labelName = "104.cce 乙班"
        moreCell3.iconImageName = "more_facebook_club_icon85x85_"
        moreCell3.detailText = ""
        moreCell3.hasAccessoryView = false
        moreCells.append(moreCell3)
        
        let moreCell4 = More()
        moreCell4.labelName = "270度影像後照鏡"
        moreCell4.iconImageName = "more_facebook_club_icon85x85_"
        moreCell4.detailText = ""
        moreCell4.hasAccessoryView = false
        moreCells.append(moreCell4)
        
        let moreCell5 = More()
        moreCell5.labelName = "Oculus"
        moreCell5.iconImageName = "more_facebook_oculus_icon85x85_"
        moreCell5.detailText = ""
        moreCell5.hasAccessoryView = false
        moreCells.append(moreCell5)
        
        let moreCell6 = More()
        moreCell6.labelName = "朋友"
        moreCell6.iconImageName = "more_facebook_friends_icon85x85_"
        moreCell6.detailText = ""
        moreCell6.hasAccessoryView = false
        moreCells.append(moreCell6)
        
        let moreCell7 = More()
        moreCell7.labelName = "社團"
        moreCell7.iconImageName = "more_facebook_club_colored_icon85x85_"
        moreCell7.detailText = ""
        moreCell7.hasAccessoryView = false
        moreCells.append(moreCell7)
        
        let moreCell8 = More()
        moreCell8.labelName = "Marketplace"
        moreCell8.iconImageName = "more_facebook_marketplace_icon85x85_"
        moreCell8.detailText = ""
        moreCell8.hasAccessoryView = false
        moreCells.append(moreCell8)
        
        let moreCell9 = More()
        moreCell9.labelName = "Watch 影片"
        moreCell9.iconImageName = "more_facebook_watch_icon85x85_"
        moreCell9.detailText = ""
        moreCell9.hasAccessoryView = false
        moreCells.append(moreCell9)
        
        let moreCell10 = More()
        moreCell10.labelName = "活動"
        moreCell10.iconImageName = "more_facebook_events_icon85x85_"
        moreCell10.detailText = ""
        moreCell10.hasAccessoryView = false
        moreCells.append(moreCell10)
        
        let moreCell11 = More()
        moreCell11.labelName = "動態回顧"
        moreCell11.iconImageName = "more_facebook_timelinereplay_icon85x85_"
        moreCell11.detailText = ""
        moreCell11.hasAccessoryView = false
        moreCells.append(moreCell11)
        
        let moreCell12 = More()
        moreCell12.labelName = "我的珍藏"
        moreCell12.iconImageName = "more_facebook_entreasure_icon85x85_"
        moreCell12.detailText = ""
        moreCell12.hasAccessoryView = false
        moreCells.append(moreCell12)
        
        let moreCell13 = More()
        moreCell13.labelName = "粉絲專頁"
        moreCell13.iconImageName = "more_facebook_fanpage_icon85x85_"
        moreCell13.detailText = ""
        moreCell13.hasAccessoryView = false
        moreCells.append(moreCell13)
        
        let moreCell14 = More()
        moreCell14.labelName = "顯示更多"
        moreCell14.iconImageName = "more_facebook_displaymore_icon85x85_"
        moreCell14.detailText = ""
        moreCell14.hasAccessoryView = false
        moreCells.append(moreCell14)
        
        let moreCell15 = More()
        moreCell15.labelName = "協助和支援"
        moreCell15.iconImageName = "more_facebook_support_icon85x85_"
        moreCell15.detailText = ""
        moreCell15.hasAccessoryView = false
        moreCells.append(moreCell15)
        
        let moreCell16 = More()
        moreCell16.labelName = "設定和隱私"
        moreCell16.iconImageName = "more_facebook_settings_icon85x85_"
        moreCell16.detailText = ""
        moreCell16.hasAccessoryView = false
        moreCells.append(moreCell16)
        
        let moreCell17 = More()
        moreCell17.labelName = "登出"
        moreCell17.iconImageName = "more_facebook_logout_icon85x85_"
        moreCell17.detailText = ""
        moreCell17.hasAccessoryView = false
        moreCells.append(moreCell17)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreCells.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: moreCellId, for: indexPath) as! MoreCell
        
        let index = indexPath.row
        cell.index = index
        cell.textLabel?.text = moreCells[indexPath.row].labelName
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.imageView?.image = UIImage(named: moreCells[indexPath.row].iconImageName!)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.layer.cornerRadius = 20
        cell.imageView?.clipsToBounds = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.view.layoutIfNeeded()
    }
    
}


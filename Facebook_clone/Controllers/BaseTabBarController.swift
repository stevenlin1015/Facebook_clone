//
//  ViewController.swift
//  Facebook_clone
//
//  Created by Steven on 2019/7/22.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //動態時報
        let timelineController = TimelineViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let timelineNavigationController = UINavigationController(rootViewController: timelineController)
        timelineNavigationController.navigationBar.isTranslucent = false
        timelineNavigationController.hidesBarsOnSwipe = true
        timelineNavigationController.tabBarItem.image = UIImage(named: "tabbaritems_facebook_timeline_icon_125x84_")
        timelineNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        //個人首頁
        let timelineController3 = TimelineViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let timelineNavigationController3 = UINavigationController(rootViewController: timelineController3)
        timelineNavigationController3.navigationBar.isTranslucent = false
        timelineNavigationController3.hidesBarsOnSwipe = true
        timelineNavigationController3.tabBarItem.image = UIImage(named: "tabbaritems_facebook_profile_icon_125x84_")
        timelineNavigationController3.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        //社團
        let timelineController4 = TimelineViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let timelineNavigationController4 = UINavigationController(rootViewController: timelineController4)
        timelineNavigationController4.navigationBar.isTranslucent = false
        timelineNavigationController4.hidesBarsOnSwipe = true
        timelineNavigationController4.tabBarItem.image = UIImage(named: "tabbaritems_facebook_club_icon_125x84_")
        timelineNavigationController4.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        //通知
        let timelineController5 = TimelineViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let timelineNavigationController5 = UINavigationController(rootViewController: timelineController5)
        timelineNavigationController5.navigationBar.isTranslucent = false
        timelineNavigationController5.hidesBarsOnSwipe = true
        timelineNavigationController5.tabBarItem.image = UIImage(named: "tabbaritems_facebook_notification_icon_125x84_")
        timelineNavigationController5.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        //更多
        let moreViewController = MoreViewController()
        let moreViewNavigationController = UINavigationController(rootViewController: moreViewController)
        moreViewNavigationController.navigationBar.isTranslucent = false
        moreViewNavigationController.hidesBarsOnSwipe = true
        moreViewNavigationController.tabBarItem.image = UIImage(named: "tabbaritems_facebook_more_icon_125x84_")
        moreViewNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
//        self.moreNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabbaritems_facebook_more_icon_125x84_"), tag: 0)
//        self.moreNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        //collections of controllers
        viewControllers = [timelineNavigationController, timelineNavigationController3, timelineNavigationController4, timelineNavigationController5, moreViewNavigationController]
        
        tabBar.isTranslucent = false
    }


}


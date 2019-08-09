//
//  TimelineViewController.swift
//  Facebook_clone
//
//  Created by Steven on 2019/7/22.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

let cellId = "cellId"

class TimelineViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupPosts()
        
    }
    
    func setupNavigationBar() {
        //facebook logo
        let navigationImageView = UIImageView()
        navigationImageView.image = UIImage(named: "timeline_facebook_nav_icon_260x70_")
        //nav buttons
        let searchButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "timeline_facebook_navsearch_icon80x80_"), for: .normal)
            
            return button
        }()
        let messangerButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "timeline_facebook_navmessage_icon80x80_"), for: .normal)
            
            return button
        }()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationImageView)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: messangerButton), UIBarButtonItem(customView: searchButton)]
    }
    
    func setupPosts() {
        let postSteven = Post()
        postSteven.name = "Steven Lin"
        postSteven.statusText = "Meanwhile, Beast turned to the dark side."
        postSteven.profileImageName = "profile"
        postSteven.statusImageName = "DSC01887"
        postSteven.numLikes = 400
        postSteven.numComments = 123
        
        
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.statusText = "“The future is private,” Zuckerberg told the crowd,\nnoting that Facebook’s most dominant vision over the last decade was to build global communities that would bring the world together, for better or worse. “Over time, I believe that a private social platform will be even more important to our lives than our digital town squares.\nSo today, we’re going to start talking about what this could look like as a product, what it means to have your social experience be more intimate, and how we need to change the way we run this company in order to build this.”"
        postMark.profileImageName = "markprofileimage"
        postMark.statusImageName = "markstatusimage"
        postMark.numLikes = 1000
        postMark.numComments = 55
        
        let postSteveJobs = Post()
        postSteveJobs.name = "Steve Jobs"
        postSteveJobs.statusText = "Well, necessity...There were time sharing computers available and there was a time sharing company in Mountain View that we could get free time on, but we needed a terminal, and we couldn't afford one...So what an Apple I was, was really an extension of this terminal putting a microprocessor on the back end...And we really built it for ourselves because we couldn't afford to buy anything."
        postSteveJobs.profileImageName = "stevejobsprofileimage"
        postSteveJobs.statusImageName = "stevejobsstatusimage"
        postSteveJobs.numLikes = 333
        postSteveJobs.numComments = 22
        
        posts.append(postSteven)
        posts.append(postMark)
        posts.append(postSteveJobs)
        
        collectionView.backgroundColor = UIColor.facebookBackgroundColor
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        feedCell.timelineViewController = self
        
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {
            
            //calculate dynamic textView height according to string context.
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 8 + 44 + 8 + 8 + 250 + 8 + 24 + 8 + 1 + 44 + 8
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 16 )
        }
        
        return CGSize(width: view.frame.width, height: 460)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    let zoomImageView = UIImageView()
    let blackBackgroundView = UIView()
    var statusImageView: UIImageView?
    let navBarCoverView = UIView()
    let tabBarCoverView = UIView()
    
    func animateImageView(statusImageView: UIImageView) {
        self.statusImageView = statusImageView
        
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            
            statusImageView.alpha = 0
            
            
            blackBackgroundView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            blackBackgroundView.backgroundColor = .black
            blackBackgroundView.alpha = 0
            self.view.addSubview(blackBackgroundView)
            
            
            navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 20 + 44) //20: status bar, 44: navigation title bar
            navBarCoverView.backgroundColor = .black
            navBarCoverView.alpha = 0
            
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(navBarCoverView)
                tabBarCoverView.frame = CGRect(x: 0, y: keyWindow.frame.height - 49, width: 1000, height: 49)
                tabBarCoverView.backgroundColor = .black
                tabBarCoverView.alpha = 0
                keyWindow.addSubview(tabBarCoverView)
            }
            
            
            zoomImageView.backgroundColor = .red
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.contentMode = .scaleAspectFill
            zoomImageView.clipsToBounds = true
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOut)))
            self.view.addSubview(zoomImageView)
            
            UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
                let height = startingFrame.height * self.view.frame.width / startingFrame.width
                let y = self.view.frame.height / 2 - height / 2
                self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.blackBackgroundView.alpha = 1
                self.navBarCoverView.alpha = 1
                self.tabBarCoverView.alpha = 1
            }, completion: nil)
            
        }
    }
    
    @objc func zoomOut() {
        if let startingFrame = statusImageView!.superview?.convert(statusImageView!.frame, to: nil) {
            
            UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
                self.zoomImageView.frame = startingFrame
                self.blackBackgroundView.alpha = 0
                self.navBarCoverView.alpha = 0
                self.tabBarCoverView.alpha = 0
            }) { (didcomplete) in
                self.zoomImageView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.navBarCoverView.removeFromSuperview()
                self.tabBarCoverView.removeFromSuperview()
                self.statusImageView?.alpha = 1
            }
        }
    }
}


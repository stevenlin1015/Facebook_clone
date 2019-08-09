//
//  FeedCell.swift
//  Facebook_clone
//
//  Created by Steven on 2019/7/22.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
                attributedText.append(NSAttributedString(string: "\n昨天下午6:01 • 新北市 • ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 97, green: 103, blue: 112)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.string.count))
                
                //貼文可見度icon
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "timeline_facebook_earthicon_icon30x30_")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImageName = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        //textView.text = "Meanwhile, Beast turned to the dark side."
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC01887")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "7則留言  2次分享"
        label.textColor = UIColor.rgb(red: 97, green: 103, blue: 112)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    //post和按鈕的分隔線(用UIView做)
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 220, green: 222, blue: 227)
        return view
    }()
    
    //buttons
    let likeButton = FeedCell.setupButton(labelName: "讚", imageName: "timeline_facebook_like_icon50x50_")
    let commentButton = FeedCell.setupButton(labelName: "留言", imageName: "timeline_facebook_comment_icon50x50_")
    let shareButton = FeedCell.setupButton(labelName: "分享", imageName: "timeline_facebook_share_icon50x50_")
    let postMoreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "timeline_facebook_moreinfo_icon_40x40_"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static func setupButton(labelName: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(labelName, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor.rgb(red: 97, green: 103, blue: 112), for: .normal)
        return button
    }
    
    var timelineViewController: TimelineViewController?
    @objc func animate() {
        timelineViewController?.animateImageView(statusImageView: statusImageView)
    }
    
    func setupView() {
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(postMoreButton)
        
        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]-[v2]-8-|", views: profileImageView, nameLabel, postMoreButton)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: statusImageView)
        addConstraintsWithFormat(format: "H:[v0]-8-|", views: likesCommentsLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstraintsWithFormat(format: "V:|-16-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-12-[v0(44)]-8-[v1]-8-[v2(250)]-8-[v3(24)]-8-[v4(1)][v5(40)]-2-|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel,dividerLineView, likeButton)
        addConstraintsWithFormat(format: "V:|-16-[v0]", views: postMoreButton)
        addConstraintsWithFormat(format: "V:[v0(40)]-2-|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(40)]-2-|", views: shareButton)
    }
}

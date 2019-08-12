//
//  MoreCell.swift
//  Facebook_clone
//
//  Created by Steven on 2019/8/11.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    var index: Int?
    
    let separaterView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 56, y: 54, width: UIScreen.main.bounds.width - 56 - 16, height: 1)
        view.backgroundColor = UIColor.rgb(red: 205, green: 208, blue: 213)
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
        separaterView.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.imageView?.frame = CGRect(x: 8, y: 8, width: 40, height: 40)
        self.textLabel?.frame = CGRect(x: 56, y: 8, width: UIScreen.main.bounds.width - 8 - 40 - 8, height: 40)
        
        configCustomizeCell(indexOf: index!)
        
    }
    
    private func configCustomizeCell(indexOf cellIndex: Int) {
        if (index != 16 && index != 0) {
            separaterView.frame = CGRect(x: 56, y: 54, width: UIScreen.main.bounds.width - 56 - 16, height: 1)
        }
        if (index == 0) {
            separaterView.frame = CGRect(x: 0, y: 54, width: UIScreen.main.bounds.width - 16, height: 1)
        }
        self.addSubview(separaterView)
    }
    
}

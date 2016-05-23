//
//  restCell.swift
//  MyRestaurantFinderIOS
//
//  Created by Shruti Kangokar on 5/22/16.
//  Copyright © 2016 Savani Vishnoi. All rights reserved.
//

import UIKit

class restCell: UITableViewCell {

    let nameLabel: UILabel
    let viewCt: UILabel
    let addLabel : UILabel
    let iconImg : UIImageView
    let ratImg : UIImageView
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFontOfSize(15)
        nameLabel.textColor = .redColor()
        nameLabel.highlighted = true
        // nameLabel.
        
        addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.font = .systemFontOfSize(10)
        // addLabel.textColor = .yellowColor()
        
        iconImg = UIImageView()
        iconImg.translatesAutoresizingMaskIntoConstraints = false

        
        viewCt = UILabel()
        viewCt.translatesAutoresizingMaskIntoConstraints = false
        
        ratImg = UIImageView()
        ratImg.translatesAutoresizingMaskIntoConstraints = false

        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(addLabel)
        addSubview(viewCt)
        addSubview(iconImg)
        addSubview(ratImg)
        
        let views = ["name": nameLabel, "address": addLabel, "viewCt": viewCt, "iconImg" : iconImg]
        var layoutConstraints = [NSLayoutConstraint]()
        
        layoutConstraints.append(nameLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        layoutConstraints.append(nameLabel.centerYAnchor.constraintEqualToAnchor(centerYAnchor))
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("[address]-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[address]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activateConstraints(layoutConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

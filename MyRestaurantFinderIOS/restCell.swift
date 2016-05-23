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
        iconImg.contentMode = .ScaleToFill
       // iconImg
        
        viewCt = UILabel()
        viewCt.translatesAutoresizingMaskIntoConstraints = false
        viewCt.font = .systemFontOfSize(10)
        
        ratImg = UIImageView()
        ratImg.translatesAutoresizingMaskIntoConstraints = false
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(addLabel)
        addSubview(viewCt)
        addSubview(iconImg)
        addSubview(ratImg)
        
        let views = ["name": nameLabel, "address": addLabel, "viewCt": viewCt, "iconImg" : iconImg, "ratImg" : ratImg]
        var layoutConstraints = [NSLayoutConstraint]()
        
        layoutConstraints.append(nameLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        layoutConstraints.append(nameLabel.topAnchor.constraintEqualToAnchor(topAnchor))
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("[address]-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[address]|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("[viewCt]-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[viewCt]|", options: [], metrics: nil, views: views)
        layoutConstraints.append(ratImg.bottomAnchor.constraintEqualToAnchor(bottomAnchor))
        layoutConstraints.append(ratImg.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
//        layoutConstraints.append(viewCt.centerYAnchor.constraintEqualToAnchor(bottomAnchor))
//        layoutConstraints.append(viewCt.topAnchor.constraintEqualToAnchor(centerXAnchor))
        
        let widthContsraint = NSLayoutConstraint(item: iconImg, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50)
        let heightConstraint = NSLayoutConstraint(item: iconImg, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50)
            iconImg.addConstraints([widthContsraint, heightConstraint])
        
        let horizontalConstraint = NSLayoutConstraint(item: ratImg, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: ratImg, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        ratImg.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: ratImg, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: ratImg, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 50)
        ratImg.addConstraint(verticalConstraint)
        
        let widthConstraint1 = NSLayoutConstraint(item: ratImg, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50)
        ratImg.addConstraint(widthConstraint1)
        
        let heightConstraint1 = NSLayoutConstraint(item: ratImg, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 25)
        ratImg.addConstraint(heightConstraint1)
        

        
        NSLayoutConstraint.activateConstraints(layoutConstraints)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

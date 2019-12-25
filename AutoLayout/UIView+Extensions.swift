//
//  UIView+Extensions.swift
//  Autolayou
//
//  Created by Hassan Shahbazi on 25.12.2019.
//  Copyright © 2019 Hassan Shahbazi. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func fix(width: CGFloat = -1, height: CGFloat = -1) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if width >= 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height >= 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func fix(left: (value: CGFloat, toView: UIView)? = nil, right: (value: CGFloat, toView: UIView)? = nil, isRelative: Bool = true) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let leftSide = left {
            let (value, toView) = leftSide
            self.leadingAnchor.constraint(equalTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value).isActive = true
        }
        if let rightSide = right {
            let (value, toView) = rightSide
            self.trailingAnchor.constraint(equalTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value).isActive = true
        }
        return self
    }
    
    @discardableResult
    func fix(top: (value: CGFloat, toView: UIView)? = nil, bottom: (value: CGFloat, toView: UIView)? = nil, isRelative: Bool = true) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topSide = top {
            let (value, toView) = topSide
            self.topAnchor.constraint(equalTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value).isActive = true
        }
        if let bottomSide = bottom {
            let (value, toView) = bottomSide
            self.bottomAnchor.constraint(equalTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value).isActive = true
        }
        return self
    }
    
    @discardableResult
    func center(toX: UIView? = nil, toY: UIView? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let view = toX {
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        }
        if let view = toY {
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        }
        return self
    }
    
    @discardableResult
    func deactivate(origin: [NSLayoutConstraint.Attribute] = [], size: [NSLayoutConstraint.Attribute] = []) -> UIView {
        origin.forEach { attribute in
            self.superview?.constraints
                .filter({ target in
                    target.firstItem as? UIView == self && target.firstAttribute == attribute
                })
                .first?
                .isActive = false
        }
        size.forEach { attribute in
            self.constraints
                .filter({ target in
                    target.firstItem as? UIView == self && target.firstAttribute == attribute
                })
                .first?
                .isActive = false
        }
        return self
    }
}

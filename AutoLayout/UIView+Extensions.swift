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
    public func fix(width: CGFloat = -1, height: CGFloat = -1) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if width >= 0 {
            self.deactivate(size: [.width])
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height >= 0 {
            self.deactivate(size: [.height])
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    public func fix(left: (value: CGFloat, toView: UIView)? = nil, right: (value: CGFloat, toView: UIView)? = nil, isRelative: Bool = true) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let leftSide = left {
            let (value, toView) = leftSide
            self.deactivate(origin: [.leading])
            self.leadingAnchor.constraint(equalTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value).isActive = true
        }
        if let rightSide = right {
            let (value, toView) = rightSide
            self.deactivate(origin: [.trailing])
            self.trailingAnchor.constraint(equalTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func fix(top: (value: CGFloat, toView: UIView)? = nil, bottom: (value: CGFloat, toView: UIView)? = nil, isRelative: Bool = true) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topSide = top {
            let (value, toView) = topSide
            self.deactivate(origin: [.top])
            self.topAnchor.constraint(equalTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value).isActive = true
        }
        if let bottomSide = bottom {
            let (value, toView) = bottomSide
            self.deactivate(origin: [.bottom])
            self.bottomAnchor.constraint(equalTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func center(toX: UIView? = nil, toY: UIView? = nil) -> Self {
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
    public func deactivate(origin: [NSLayoutConstraint.Attribute] = [], size: [NSLayoutConstraint.Attribute] = []) -> Self {
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
    
    @discardableResult
    public func constants(in layouts: [NSLayoutConstraint.Attribute]) -> [NSLayoutConstraint.Attribute: CGFloat] {
        return self.constraints
            .filter { layouts.contains($0.firstAttribute) }
            .reduce(into: [:]) { (list: inout [NSLayoutConstraint.Attribute: CGFloat], constraint: NSLayoutConstraint) in
                list[constraint.firstAttribute] = constraint.constant
        }
    }
    
    @discardableResult
    public func scale(aspectRatio: CGFloat = 1.0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: aspectRatio).isActive = true
        
        return self
    }
}
